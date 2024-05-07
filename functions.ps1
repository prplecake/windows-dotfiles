. "$wd\functions\registry_functions.ps1"

function Get-ShutdownReason {
    $event = Get-WinEvent -LogName 'System' | ? { $_.ID -eq 1074 } | Select -First 1
    Write-Host "Message:" $event.Message
    Write-Host " Date:" $event.TimeCreated
}

function Get-IP {
    Write-Host (Invoke-WebRequest -Uri "https://wtfismyip.com/text").Content.Trim()
}

function Monitor-HttpHost {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Uri,

        [Parameter(Mandatory = $false)]
        [int]$SleepSeconds = 15,

        [Parameter(Mandatory = $false)]
        [switch]$Once
    )

    if ($Once) {
        try {
            $req = Invoke-WebRequest -Uri $Uri -DisableKeepAlive
            Write-Host $req.StatusCode
        }
        catch {
            Write-Host "Could not connect. $($Error[0])"
        }
    }
    else {
        Write-Host "Monitoring host $Uri at an internal of $SleepSeconds seconds."
        while ($true) {
            try {
                $req = Invoke-WebRequest -Uri $Uri -DisableKeepAlive
                Write-Host $req.StatusCode
            }
            catch {
                Write-Host "Could not connect. $($Error[0])"
            }
            Start-Sleep -Seconds $SleepSeconds
        }
    }
}

function List-EmptyDirs {
    (gci -r | ? { $_.PSIsContainer -eq $true }) | ? { $_.GetFileSystemInfos().Count -eq 0 } | Select FullName
}

function Get-SIDFromName {
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Name
    )
    $objUser = New-Object System.Security.Principal.NTAccount($Name)
    $objSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
    Write-Host "Resolved user's SID: " $objSID.Value
}

function Get-NameFromSID {
    Param(
        [Parameter(Mandatory = $true, Position = 0)]
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
        SendingEnabled  = $objSendingEnabled.Enabled
        SentLast24Hours = $objQuota.SentLast24Hours
        QuotaUsed       = $quotaPercent
    }

    $objReturn
}

function Get-AwsSendStatistics {
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$Sorted
    )

    $resSendStatistics = $($(aws ses get-send-statistics) | ConvertFrom-Json).SendDataPoints

    if ($Sorted) {
        $resSendStatistics | Sort-Object -Property Timestamp | ft
    }
    else {
        $resSendStatistics
    }


}

function Touch-File {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Path
    )
    if (!(Test-Path -Path $Path)) {
        New-Item -Type File -Path $Path
    }
    else {
        (gci $Path).LastWriteTime = Get-Date
    }
}
Set-Alias -Name touch -Value Touch-File

function Play-StarWarsTheme {
    [console]::beep(440, 500)
    [console]::beep(440, 500)
    [console]::beep(440, 500)
    [console]::beep(349, 350)
    [console]::beep(523, 150)
    [console]::beep(440, 500)
    [console]::beep(349, 350)
    [console]::beep(523, 150)
    [console]::beep(440, 1000)
    [console]::beep(659, 500)
    [console]::beep(659, 500)
    [console]::beep(659, 500)
    [console]::beep(698, 350)
    [console]::beep(523, 150)
    [console]::beep(415, 500)
    [console]::beep(349, 350)
    [console]::beep(523, 150)
    [console]::beep(440, 1000)
    [console]::beep(880, 500)
    [console]::beep(440, 350)
    [console]::beep(440, 150)
    [console]::beep(880, 500)
    [console]::beep(830, 250)
    [console]::beep(784, 250)
    [console]::beep(740, 125)
    [console]::beep(698, 125)
    [console]::beep(740, 250)
    [console]::beep(455, 250)
    [console]::beep(622, 500)
    [console]::beep(587, 250)
    [console]::beep(554, 250)
    [console]::beep(523, 125)
    [console]::beep(466, 125)
    [console]::beep(523, 250)
    [console]::beep(349, 125)
    [console]::beep(415, 500)
    [console]::beep(349, 375)
    [console]::beep(440, 125)
    [console]::beep(523, 500)
    [console]::beep(440, 375)
    [console]::beep(523, 125)
    [console]::beep(659, 1000)
    [console]::beep(880, 500)
    [console]::beep(440, 350)
    [console]::beep(440, 150)
    [console]::beep(880, 500)
    [console]::beep(830, 250)
    [console]::beep(784, 250)
    [console]::beep(740, 125)
    [console]::beep(698, 125)
    [console]::beep(740, 250)
    [console]::beep(455, 250)
    [console]::beep(622, 500)
    [console]::beep(587, 250)
    [console]::beep(554, 250)
    [console]::beep(523, 125)
    [console]::beep(466, 125)
    [console]::beep(523, 250)
    [console]::beep(349, 250)
    [console]::beep(415, 500)
    [console]::beep(349, 375)
    [console]::beep(523, 125)
    [console]::beep(440, 500)
    [console]::beep(349, 375)
    [console]::beep(261, 125)
    [console]::beep(440, 1000)
}

function Open-InAllBrowsers {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Uri
    )
    $firefox = "C:\Program Files\Mozilla Firefox\firefox.exe"
    $chrome = "C:\Program Files\Google\Chrome\Application\chrome.exe"
    $edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"

    & $firefox --new-window $Uri
    & $chrome --new-window $Uri
    & $edge --new-window $Uri
}

$limegreen = "`e[38;5;118m"
$orange = "`e[38;5;166m"
$purple = "`e[38;5;135m"

if ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -contains 'S-1-5-32-544') {
    $_prompt = '#'
}
else {
    $_prompt = '>'
}

# Set prompt
Function prompt {
    "`r`n$($purple)$(whoami) `e[0mat $($orange)$(hostname) `e[0min $($limegreen)" `
        + "$((Get-Location).Path -replace ([regex]::Escape($HOME)),'~')" `
        + "$(Write-VcsStatus)`r`n`e[0mPS$($_prompt  * ($nestedPromptLevel + 1)) "
}

function Edit-PSProfile {
    code (Split-Path ($PROFILE.CurrentUserCurrentHost))
}

function Add-Path($Path) {
    $Path = [Environment]::GetEnvironmentVariable("PATH", "Machine") + [IO.Path]::PathSeparator + $Path
    [Environment]::SetEnvironmentVariable( "Path", $Path, "Machine" )
}

function New-PFXFromCertKey {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CertificatePath,

        [Parameter(Mandatory = $true)]
        [string]$CertificateKeyPath
    )

    $certname = (Get-Item $CertificatePath).BaseName
    $outDir = (Get-Item $CertificatePath).DirectoryName

    openssl pkcs12 -export `
        -out "$outDir\$certname.pfx" `
        -in $CertificatePath `
        -inkey $CertificateKeyPath
}

function ConvertTo-3cxAudioMessage {
    Param(
        [Parameter(Mandatory = $true)]
        [string]$AudioFile
    )

    $fileName = (Get-Item $AudioFile).BaseName
    $outDir = (Get-Item $AudioFile).DirectoryName

    ffmpeg -i $AudioFile -acodec pcm_s16le -ar 8000 -ac 1 "$outDir\$fileName.wav"
}

function Remove-AppLauncherDrives {
    $driveLetters = @("L", "S", "P")
    foreach($driveLetter in $driveLetters){
        Write-Output "Removing drive $driveLetter"
        net use "${driveLetter}:" /delete 2> $null
    }
}
