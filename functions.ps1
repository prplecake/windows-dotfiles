. "$wd\functions\registry_functions.ps1"

function Get-ShutdownReason {
    $event = Get-WinEvent -LogName 'System' | ?{ $_.ID -eq 1074} | Select -First 1
    Write-Host "Message:" $event.Message
    Write-Host " Date:" $event.TimeCreated
}

function Get-IP {
    Write-Host (Invoke-WebRequest -Uri "https://wtfismyip.com/text").Content.Trim()
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
            $req = Invoke-WebRequest -Uri $Uri -DisableKeepAlive
            Write-Host $req.StatusCode
        } catch {
            Write-Host "Could not connect. $($Error[0])"
        }
        Start-Sleep -Seconds $SleepSeconds
    }
}

function List-EmptyDirs {
    (gci -r | ?{$_.PSIsContainer -eq $true}) | ?{$_.GetFileSystemInfos().Count -eq 0} | Select FullName
}

function Get-SIDFromName {
    Param(
        [Parameter(Mandatory=$true,Position=0)]
        [string]$Name
    )
    $objUser = New-Object System.Security.Principal.NTAccount($Name)
    $objSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
    Write-Host "Resolved user's SID: " $objSID.Value
}

function Get-NameFromSID {
    Param(
        [Parameter(Mandatory=$true,Position=0)]
        [string]$SID
    )
    $objSID = New-Object System.Security.Principal.SecurityIdentifier($SID)
    $objUser = $objSID.Translate([System.Security.Principal.NTAccount])
    Write-Host "Resolved user name: " $objUser.Value
}

function Get-AwsSesSendQuota {
    $resQuota = $(aws ses get-send-quota)
    $resSendingEnabled = $(aws ses get-account-sending-enabled)
    $objQuota = $resQuota | ConvertFrom-Json
    $objSendingEnabled = $resSendingEnabled | ConvertFrom-Json

    $quotaPercent = $($objQuota.SentLast24Hours / $objQuota.Max24HourSend * 100)

    $objReturn = New-Object -TypeName PSObject -Property @{
        SendingEnabled = $objSendingEnabled.Enabled
        SentLast24Hours = $objQuota.SentLast24Hours
        QuotaUsed = $quotaPercent
    }

    $objReturn
}

function Play-StarWarsTheme {
    [console]::beep(440,500)
    [console]::beep(440,500)
    [console]::beep(440,500)
    [console]::beep(349,350)
    [console]::beep(523,150)
    [console]::beep(440,500)
    [console]::beep(349,350)
    [console]::beep(523,150)
    [console]::beep(440,1000)
    [console]::beep(659,500)
    [console]::beep(659,500)
    [console]::beep(659,500)
    [console]::beep(698,350)
    [console]::beep(523,150)
    [console]::beep(415,500)
    [console]::beep(349,350)
    [console]::beep(523,150)
    [console]::beep(440,1000)
    [console]::beep(880,500)
    [console]::beep(440,350)
    [console]::beep(440,150)
    [console]::beep(880,500)
    [console]::beep(830,250)
    [console]::beep(784,250)
    [console]::beep(740,125)
    [console]::beep(698,125)
    [console]::beep(740,250)
    [console]::beep(455,250)
    [console]::beep(622,500)
    [console]::beep(587,250)
    [console]::beep(554,250)
    [console]::beep(523,125)
    [console]::beep(466,125)
    [console]::beep(523,250)
    [console]::beep(349,125)
    [console]::beep(415,500)
    [console]::beep(349,375)
    [console]::beep(440,125)
    [console]::beep(523,500)
    [console]::beep(440,375)
    [console]::beep(523,125)
    [console]::beep(659,1000)
    [console]::beep(880,500)
    [console]::beep(440,350)
    [console]::beep(440,150)
    [console]::beep(880,500)
    [console]::beep(830,250)
    [console]::beep(784,250)
    [console]::beep(740,125)
    [console]::beep(698,125)
    [console]::beep(740,250)
    [console]::beep(455,250)
    [console]::beep(622,500)
    [console]::beep(587,250)
    [console]::beep(554,250)
    [console]::beep(523,125)
    [console]::beep(466,125)
    [console]::beep(523,250)
    [console]::beep(349,250)
    [console]::beep(415,500)
    [console]::beep(349,375)
    [console]::beep(523,125)
    [console]::beep(440,500)
    [console]::beep(349,375)
    [console]::beep(261,125)
    [console]::beep(440,1000)
}