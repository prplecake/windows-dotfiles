function Get-ShutdownReason {
    $event = Get-WinEvent -LogName 'System' | ?{ $_.ID -eq 1074}
    Write-Host "Message:" $event.Message
    Write-Host " Date:" $event.TimeCreated
}

function Get-IP {
    Write-Host (Invoke-WebRequest -Uri https://wtfismyip.com/text).Content.Trim()
}

function Monitor-HttpHost {
    Param(
        [Parameter(Mandatory=$true)]
        [string]$Uri,

        [Parameter(Mandatory=$false)]
        [int]$SleepSeconds = 15
    )


    Write-Host "Monitoring host $Uri at an internal of $SleepSeconds seconds."
    while($true){
        try {
            $req = Invoke-WebRequest -Uri https://dev.fortressmedical.com -DisableKeepAlive
            Write-Host $req.StatusCode
        } catch {
            Write-Host "Could not connect. $($Error[0])"
        }
        Start-Sleep -Seconds $SleepSeconds
    }
}