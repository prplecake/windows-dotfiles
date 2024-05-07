###
# Aliases
###

Set-Alias -Name ll -Value ls


# Exit PowerShell on Ctrl+D
Set-PSReadlineKeyHandler -Key Ctrl+D -Function ViExit


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
function yarn { corepack yarn $args }
function yarnpkg { corepack yarnpkg $args }
function pnpm { corepack pnpm $args }
function pnpx { corepack pnpx $args }
function npm { corepack npm $args }
function npx { corepack npx $args }
