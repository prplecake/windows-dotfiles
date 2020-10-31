function Get-ShutdownReason {
    $event = Get-WinEvent -LogName 'System' | ?{ $_.ID -eq 1074}
    Write-Host "Message:" $event.Message
    Write-Host " Date:" $event.TimeCreated
}