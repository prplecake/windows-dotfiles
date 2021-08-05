###
# Aliases
###

Set-Alias -Name ll -Value ls
Set-Alias -Name which -Value Get-Command
Set-Alias -Name ydl -Value youtube-dl

###
# Functions Aliases
###

function Open-SublimeTextAndMerge { & smerge $args; & subl $args }
New-Alias -Name lime -Value Open-SublimeTextAndMerge

function Test-HostReachability {
    test-connection $args -Repeat | select @{n='TimeStamp';e={Get-Date}}, Ping, Destination, Address, Latency | ft
}
Set-Alias -Name ping2 -Value Test-HostReachability

function Better-Ping {
    & ping.exe $args -t
}
Set-Alias -Name ping -Value Better-Ping

# Source git aliases
. "$wd\git-aliases.ps1"
