Import-Module Chocolatey-AU

function global:au_GetLatest {
    $url = "https://icedrive.net/apps/desktop-laptop"
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing
    $htmlContent = $response.Content
    $urlRegex = [regex] 'https://cdn.icedrive.net/static/apps/win/Icedrive_Installer-[\d\.]+\.exe'
    $urlMatch = $urlRegex.Match($htmlContent)
    if ($urlMatch.Success) {
        $versionRegex = [regex] 'Icedrive_Installer-(?<version>[\d\.]+)\.exe'
        $versionMatch = $versionRegex.Match($urlMatch.Value)
        $version = $versionMatch.Groups["version"].Value
        
        return @{
            Version      = $version
            URL64        = $urlMatch.Value
            ReleaseNotes = 'https://icedrive.net/changelog'
        }
    } else {
        Write-Error "Couldn't find newest installer download URL."
    }
}

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(?i)(^\s*(\$)url64\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
			"(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
			"(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
		}
	}
}

update -ChecksumFor 64
