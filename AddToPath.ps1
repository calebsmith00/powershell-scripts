# Current drive letter
$DriveLetter = (Get-Location).Drive.Name

# Git
$Env:Path += ";${DriveLetter}:\portable\Git\cmd";

# VS Code
$Env:Path += ";${DriveLetter}:\portable\VSCode-win32-x64-1.70.1"

# Node
$Env:Path += ";${DriveLetter}:\portable\node-v18.7.0-win-x64"

# NP++
$Env:Path += ";${DriveLetter}:\portable\npp.8.4.4.portable.x64"

# Reboot the machine
$ShouldRestart = Read-Host "Path variables set and a reboot is needed. Is this OK (Y/N)? "

if ($ShouldRestart.ToLower() -eq "y") {
	Restart-Computer
}

echo "Path variables will be available on next reboot :)"