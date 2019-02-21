param
(
[Parameter(Mandatory=$true)][Int]$pullPushTimeSpan
)
 $execpol = get-executionpolicy
    if(-not ($execpol -match '[uU]nrestricted')) {
        set-executionpolicy unrestricted
    }
function autogit($a)
{
	$gitPullPushTimeSpan = New-TimeSpan -Minutes "$a"	
    $gitCommitTimeReminderSpan = New-TimeSpan -Minutes 0
    $stopWatch = [System.Diagnostics.Stopwatch]::StartNew();
    $commitTime = 0;
    while ($stopWatch.Elapsed -le $gitPullPushTimeSpan) 
    {
          if($stopWatch.Elapsed -ge $gitCommitTimeReminderSpan) 
          {
              $commitTime = $committime + 20;
              $gitCommitTimeReminderSpan = New-TimeSpan -Minutes $committime;
                 Write-Host "Dont forget to commit your Work" -ForegroundColor Red
                 Write-Host "`n"
                 git status
          }
          Sleep -s $a
         
    }
     if($stopWatch.Elapsed -ge $gitPullPushTimeSpan) 
          {
              $stopWatch.Reset();
              $commitTime = 0;
              $commas = Read-Host "The Time for a push is up. Please Type in your Commitmessage"
              git commit -am "$commas"
              git pull;
              git push;
              autogit -a $a
          }

}
  if((get-executionpolicy) -ne $execpol)
    {
        set-executionpolicy $execpol
        write-host "$(get-executionpolicy)"
    }
autogit -a $pullPushTimeSpan 



function Sleep($s)
{
     if(Get-Date -Format HH:mm  -eq 20:00)
          {
          while(not Get-Date -Format HH:mm  -eq 07:30 -and not Get-Date -Date DayofWeek -match "Sunday|Saturday" )
          {
            sleep 1
          }
          }
          autogit -a $s
       
}