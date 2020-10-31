function Get-GitStatus { & git status $args }
New-Alias -Name gst -Value Get-GitStatus

function Set-GitCommit { & git commit -v $args }
New-Alias -Name c -Value Set-GitCommit

function Set-GitCommitFiles { & git add $args }
New-Alias -Name ga -Value Set-GitCommitFiles

function Set-GitCommitAllFiles { & git add --all }
New-Alias -Name gaa -Value Set-GitCommitAllFiles

function New-GitPush { & git push $args }
New-Alias -Name p -Value New-GitPush