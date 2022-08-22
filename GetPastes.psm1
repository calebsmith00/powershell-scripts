function Get-RawPaste
{
	Param (
		[Parameter(Mandatory=$True)]
		$PasteKey
	)
	$api_paste_key      = $PasteKey;
	$return = $(New-Object Net.WebClient).DownloadString("https://pastebin.com/raw/$api_paste_key")
	if ($return.Contains('AD-BLOCK DETECTED')) {
		return 'AD-BLOCK DETECTED';
	} else {
		return $return
	}
}

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