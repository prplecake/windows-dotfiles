$ClindexLiveSites = @(
    's2',
    's3'
)

function Get-EcoaVersion {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Uri
    )

    if ($Uri -notmatch '^https?') {
        $Uri = "https://$Uri"
    }
    if ($Uri -notmatch '\.myclindex\.com$'){
        $Uri = "$Uri.myclindex.com"
    }

    $result = Invoke-WebRequest -Uri $Uri -UseBasicParsing
    Write-Host $result.Headers['FMS-Version']
}

function Get-PasswordResetVersions {
    $ErrorActionPreference = 'Stop'

    $Results = @{}

    foreach ($site in $ClindexLiveSites){
        $uri = "passwordreset.${site}.clindexlive.com"
        $result = Invoke-WebRequest -Uri "https://$uri" -UseBasicParsing
        $Results[$uri] = $result.Headers['FMS-Version'][0]
    }
    $Results
}

function Get-WebServicesVersions {
    $ErrorActionPreference = 'Stop'

    $Results = @{}

    foreach ($site in $ClindexLiveSites){
        $uri = "services.${site}.clindexlive.com"
        $result = Invoke-WebRequest -Uri "https://$uri" -UseBasicParsing
        $Results[$uri] = $result.Headers['FMS-Version'][0]
    }
    $Results
}

function Get-ClindexLiveSiteVersions {
    $passwordReset = Get-PasswordResetVersions
    $webServices = Get-WebServicesVersions
    (Merge-Hashtables $passwordReset $webServices).GetEnumerator() | Sort-Object Name
}