###
# Aliases
###

Set-Alias -Name ll -Value ls
Set-Alias -Name which -Value Get-Command
Set-Alias -Name ydl -Value youtube-dl

function Open-SublimeTextAndMerge { & smerge $args; & subl $args }
New-Alias -Name lime -Value Open-SublimeTextAndMerge

# Source git aliases
. "$wd\git-aliases.ps1"
