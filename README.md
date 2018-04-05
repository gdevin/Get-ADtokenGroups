---


---

<h1 id="get-adtokengroups">Get-ADtokenGroups</h1>
<p>This is a PowerShell script to create an HTTP.sys listener that returns a list of Active Directory tokenGroups for a user.</p>
<h2 id="installation-steps">Installation Steps</h2>
<ul>
<li>
<p>Configure HTTP.sys with HttpSysManager.  This can be done with PowerShell but HttpSysManager (link below) is easier.  Granting ‘Everyone’ register and ‘SYSTEM’ register and delegate is the simplest way to get started.</p>
</li>
<li>
<p>Open port in windows firewall.  This needs to be the same port configure above.</p>
</li>
<li>
<p>Create schedule task to run the ‘Get-ADtokenGroups_Http_server.ps1’ script.  The script needs to be run with user credentials that have been granted register and delegate permissions.</p>
</li>
<li>
<p>Ensure that whatever user, or computer account if using SYSTEM, has permission to retrieve tokenGroups from Active Directory.</p>
</li>
</ul>
<h3 id="notes">Notes</h3>
<p>HTTP.sys can be configured with PowerShell commands but it is easier to use HttpSysManager from the link below.<br>
<a href="https://www.codeproject.com/Articles/437733/Demystify-http-sys-with-HttpSysManager">https://www.codeproject.com/Articles/437733/Demystify-http-sys-with-HttpSysManager</a></p>
<p><img alt="HttpSysManager1" src="https://github.com/gdevin/Get-ADtokenGroups/blob/master/Images/HttpSysManager1.JPG"></p>
<p><img alt="HttpSysManager2" src="https://github.com/gdevin/Get-ADtokenGroups/blob/master/Images/HttpSysManager2.JPG"></p>

