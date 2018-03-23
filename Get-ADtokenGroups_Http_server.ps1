
   $ServerThreadCode = {
    $listener = New-Object System.Net.HttpListener
    $listener.Prefixes.Add('http://*:4567/Get-ADtokenGroups/') 
    $listener.Start()
    
    while ($listener.IsListening) {
       [System.Net.HttpListenerContext]$context = $listener.GetContext() # blocks until request is received
       [System.Net.HttpListenerRequest]$request = $context.Request
       [System.Net.HttpListenerResponse]$response = $context.Response
       $responseString = "<HTML><BODY>"

       ForEach ($key in $request.QueryString.Keys) {        
          If ($key -eq "netid") {
             [string]$user = $request.QueryString.GetValues($key)

             Try {
                $tokenGroups = Get-ADUser -SearchScope Base -SearchBase (Get-ADUser $user).DistinguishedName `
                -LDAPFilter '(objectClass=user)' -Properties tokenGroups | Select-Object `
                -ExpandProperty tokenGroups | Select-Object -ExpandProperty Value
             }
             Catch {
                $responseString += "Invalid user!<br>"
             }
             $groups = $tokengroups | `
                ForEach-Object { 
                   Try {
                      ((New-Object System.Security.Principal.SecurityIdentifier($_)).Translate( [System.Security.Principal.NTAccount])).Value
                   }
                   Catch { }
                }
             $groups | ForEach-Object {
                $responseString += $_ + "<br>"
             }             
          }
       }
       
       $responseString += "</BODY></HTML>"
       [byte[]] $buffer = [System.Text.Encoding]::UTF8.GetBytes($responseString)
       $response.ContentLength64 = $buffer.length
       $output = $response.OutputStream
       $output.Write($buffer, 0, $buffer.length)
       $output.Close()
    }
    $listener.Stop()
}                  

Import-Module activedirectory
$serverJob = Start-Job $ServerThreadCode
# Wait for it all to complete
while ($serverJob.State -eq "Running") { Start-Sleep -s 1 }

