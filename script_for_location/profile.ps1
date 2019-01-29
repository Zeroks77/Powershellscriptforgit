$userpath = "C:\Develop\AC-Configbuilder";
$Location = Get-Location -PSDrive C;

if ("$Location" -eq "C:\Windows\System32"  -or "$Location" -eq "C:\Users\doma")                              
{     
    Set-Location $userpath;
    git status
}