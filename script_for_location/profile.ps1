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


$autopull = Read-Host -Prompt 'Do you want to Autopull every 90 min. ? Y/N'
if ($autopull -match '[yY]')
{
    $Location = Get-Location -PSDrive C;
    
    invoke-expression 'cmd /c start powershell -NoProfile -NoExit -Command {Set-Location "$Location";

    $stopWatch = [System.Diagnostics.Stopwatch]::StartNew();
    $timeSpan = New-TimeSpan -Minutes 90;
    $one = 1;
   while (2 -ge $one) 
   {
        if($stopWatch.Elapsed -ge $timeSpan) 
        {
            $stopWatch.Reset();
            git pull;
        }
    }}'
}





