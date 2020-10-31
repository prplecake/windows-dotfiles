$wd = Split-Path $PROFILE

. "$wd\aliases.ps1"
. "$wd\functions.ps1"

# Exit PowerShell on Ctrl+D
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit