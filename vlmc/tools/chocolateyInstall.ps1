$ErrorActionPreference = 'Stop'

$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName            = 'vlmc'
  fileType               = 'exe'
  url                    = 'http://ftp.videolan.org/pub/testing/vlmc/vlmc-0.2.0-win32.exe'
  checksum               = '63599EBA59D3A5A97904C39286C22C2C3B9FDF343B149B79C2A840F51D4DB5F0'
  checksumType           = 'sha256'
  silentArgs             = '/VERYSILENT'
  validExitCodes         = @(0)
  softwareName           = 'vlmc*'
}
Install-ChocolateyPackage @packageArgs

$packageName = $packageArgs.packageName
$installLocation = Get-AppInstallLocation $packageName
if (!$installLocation)  { Write-Warning "Can't find $packageName install location"; return }
Write-Host "$packageName installed to '$installLocation'"

Register-Application "$installLocation\$packageName.exe"
Write-Host "$packageName registered as $packageName"
