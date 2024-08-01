$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64      = 'https://cdn.icedrive.net/static/apps/win/Icedrive_Installer-2.75.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'icedrive*'
  checksum64    = '87AF441AC5505E30A476AAD3FCF3157DACC1288AA96BEE26A69D603B109F8B79'
  checksumType64= 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
