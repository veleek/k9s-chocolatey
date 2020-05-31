# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64    = 'https://github.com/derailed/k9s/releases/download/v0.20.2/k9s_Windows_x86_64.tar.gz'
$tarName  = [System.IO.Path]::GetFileNameWithoutExtension((Split-Path -Leaf $url64))
$tarPath  = Join-Path $toolsDir $tarName

$getFileArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url64bit       = $url64
  checksum64     = '485ef75ccf8c4e5bac5f4595590816b9d3fc60cfb90fbf37c38a1847e28145ce'
  checksumType64 = 'sha256'
}

$unTarArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileFullPath64 = $tarPath
  destination    = $toolsDir
}

Install-ChocolateyZipPackage @getFileArgs
Get-ChocolateyUnzip @unTarArgs
Remove-Item $tarPath
