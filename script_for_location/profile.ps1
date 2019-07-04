$Location = Get-Location -PSDrive C;
if ("$Location" -eq 'C:\Windows\System32'  -or "$Location" -eq 'C:\Users\doma')                              
{     
    Set-Location $env:WorkingDirectory   
}

$path = Resolve-Path ~\Documents\WindowsPowerShell\Startgit.ps1
 powershell.exe -noexit -File $path