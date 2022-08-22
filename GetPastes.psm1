Import-Module -Name ".\Pastebin.psm1"

function Get-TailwindConfig
{
  return Get-RawPaste -PasteKey "8G2PVhpw"
}

function Get-IndexPage([switch]$typescript)
{
  if ($typescript.IsPresent) {
    return Get-RawPaste -PasteKey "DDhbXSXE"
  } else {
    return Get-RawPaste -PasteKey "3v1VM6QS"
  }
}

function Get-Globals 
{
  return Get-RawPaste -PasteKey "j2yhqKUn"
}