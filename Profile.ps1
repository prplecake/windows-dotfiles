$wd = Split-Path $PROFILE

. "$wd\aliases.ps1"
. "$wd\functions.ps1"

# Exit PowerShell on Ctrl+D
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Import Posh-Git
Import-Module Posh-Git

# Set window title to something more sensible than
# 'C:\Users\$username - PowerShell $version ($pid)'
$global:GitPromptSettings.WindowTitle = {
    param($GitStatus, [bool]$IsAdmin)
    "PS $($PSVersionTable.PSVersion.Major).$($PSVersionTable.PSVersion.Minor)"
}
