$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64      = 'https://cdn.icedrive.net/static/apps/win/Icedrive_Installer-2.74.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'icedrive*'
  checksum64    = 'C9FBC0D2BD42F1DE8E7D612B2AF65AA643AD75E923CA0AE5D1BD45E9C29A7934'
  checksumType64= 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
