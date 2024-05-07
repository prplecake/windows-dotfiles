function Disable-ShakeToMinimize {
    $registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    $name = "DisallowShaking"
    $value = 1
    New-ItemProperty -LiteralPath $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
    Write-Host "Shake to Minimize disabled."
}
function Enable-ShakeToMinimize {
    $registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    $name = "DisallowShaking"
    $value = 0
    New-ItemProperty -LiteralPath $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
    Write-Host "Shake to Minimize enabled."
}

function Add-FleetContextMenu {
    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
    $fleetPath = "C:\Users\mjorgensen\AppData\Local\Programs\Fleet\Fleet.exe"

    # Add for all file types
    $path = "HKCR:\*\shell\Open with Fleet"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Fleet" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$fleetPath,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$fleetPath `"%1`"" -PropertyType String -Force | Out-Null

    # Add for folders
    $path = "HKCR:\Directory\shell\Open with Fleet"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Fleet" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$fleetPath,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$fleetPath `"%1`"" -PropertyType ExpandString -Force | Out-Null

    # Add for inside folders
    $path = "HKCR:\Directory\Background\shell\Open with Fleet"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Fleet" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$fleetPath,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$fleetPath `"%V`"" -PropertyType String -Force | Out-Null

    Remove-PSDrive HKCR
}

function Add-SublimeTextContextMenu {
    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
    $st3Path = "C:\Program Files\Sublime Text 3\sublime_text.exe"

    # Add for all file types
    $path = "HKCR:\*\shell\Open with Sublime Text"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Sublime Text 3" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$st3Path,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$st3Path `"%1`"" -PropertyType String -Force | Out-Null

    # Add for folders
    $path = "HKCR:\Directory\shell\Open with Sublime Text"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Sublime Text 3" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$st3Path,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$st3Path `"%1`"" -PropertyType ExpandString -Force | Out-Null

    # Add for inside folders
    $path = "HKCR:\Directory\Background\shell\Open with Sublime Text"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Sublime Text 3" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$st3Path,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$st3Path `"%V`"" -PropertyType String -Force | Out-Null

    Remove-PSDrive HKCR
}

function Add-SublimeMergeContextMenu {
    New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null
    $smPath = "C:\Program Files\Sublime Merge\sublime_merge.exe"

    # Add for all file types
    $path = "HKCR:\*\shell\Open with Sublime Merge"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Sublime Merge" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$smPath,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$smPath `"%1`"" -PropertyType String -Force | Out-Null

    # Add for folders
    $path = "HKCR:\Directory\shell\Open with Sublime Merge"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Sublime Merge" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$smPath,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$smPath `"%1`"" -PropertyType ExpandString -Force | Out-Null

    # Add for inside folders
    $path = "HKCR:\Directory\Background\shell\Open with Sublime Merge"
    New-Item -Path "$path" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "(Default)" -Value "Open with Sublime Merge" -PropertyType String -Force | Out-Null
    New-ItemProperty -LiteralPath "$path" -Name "Icon" -Value "$smPath,0" -PropertyType ExpandString -Force | Out-Null
    New-Item -Path "$path\command" -Force | Out-Null
    New-ItemProperty -LiteralPath "$path\command" -Name "(Default)" -Value "$smPath `"%V`"" -PropertyType String -Force | Out-Null

    Remove-PSDrive HKCR
}

function Add-SublimeContextMenus {
    Add-SublimeMergeContextMenu
    Add-SublimeTextContextMenu
}