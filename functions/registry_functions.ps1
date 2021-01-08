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