$ErrorActionPreference = 'Stop'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64      = 'https://cdn.icedrive.net/static/apps/win/Icedrive_Installer-2.75.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64bit      = $url64
  softwareName  = 'icedrive*'
  checksum64    = '87af441ac5505e30a476aad3fcf3157dacc1288aa96bee26a69d603b109f8b79'
  checksumType64= 'sha256'
  silentArgs   = '/S'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
