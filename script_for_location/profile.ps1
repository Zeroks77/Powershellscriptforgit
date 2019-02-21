$Location = Get-Location -PSDrive C;
if ("$Location" -eq 'C:\Windows\System32'  -or "$Location" -eq 'C:\Users\doma')                              
{     
    Set-Location $env:WorkingDirectory   
}
git branch
$branchbool = Read-Host -Prompt 'Is this the right Branch you want to work on? Y/N'

 if ($branchbool -match '[nN]')
{
 $branch = Read-Host -Prompt 'Type in the Right Branch: '   
git checkout $branch
git status
}else 
{
    git status
}

$autopull = Read-Host -Prompt 'Do you want to Auto-Pull and -Push every 90 min. ? Y/N'
if ($autopull -match '[yY]')
{
    $Location = Get-Location -PSDrive C;
    $execpol = get-executionpolicy
    if(-not ($execpol -match '[uU]nrestricted')) {
        set-executionpolicy unrestricted
    }
        start-process powershell -Verb runAs -ArgumentList('-noprofile','-File ~\Documents\WindowsPowerShell\autoscript.ps1 -pullPushTimeSpan 90')

        if((get-executionpolicy) -ne $execpol)
    {
        set-executionpolicy $execpol
        write-host "$(get-executionpolicy)"
    }
}
