# Get-ADtokenGroups

This is a PowerShell script to create an HTTP.sys listener that returns a list of Active Directory tokenGroups for a user.


## Installation Steps

- Configure HTTP.sys with HttpSysManager.  This can be done with PowerShell but HttpSysManager (link below) is easier.  Granting 'Everyone' register and 'SYSTEM' register and delegate is the simplest way to get started.

- Open port in windows firewall.  This needs to be the same port configure above.
 - Create schedule task to run the 'Get-ADtokenGroups_Http_server.ps1' script.  The script needs to be run with user credentials that have been granted register and delegate permissions.

- Ensure that whatever user, or computer account if using SYSTEM, has permission to retrieve tokenGroups from Active Directory.


### Notes 

HTTP.sys can be configured with PowerShell commands but it is easier to use HttpSysManager from the link below.
https://www.codeproject.com/Articles/437733/Demystify-http-sys-with-HttpSysManager


![HttpSysManager1](https://github.com/gdevin/Get-ADtokenGroups/blob/master/HttpSysManager1.JPG)


![HttpSysManager2](https://github.com/gdevin/Get-ADtokenGroups/blob/master/HttpSysManager2.JPG)

