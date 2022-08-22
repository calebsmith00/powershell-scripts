param(
  [Parameter()]
  [String]$dir,
  [String]$projectName,
  [switch]$typescript,
  [switch]$ts
)
Import-Module -Name ".\GetPastes.psm1" -Force

$dir = If ($dir.Length -eq 0) {Get-Location} Else {$dir}
$projectName = If ($projectName.Length -eq 0) {"untitledProject"} Else {$projectName}
$enableTs = If ($typescript.IsPresent -or $ts.IsPresent) {"--typescript"} Else {""}

# Run create-next-app command chain
$flags = $enableTs
npx create-next-app@latest $projectName $flags

# Navigate into that directory
$projectPath = $dir + "\" + $projectName
Set-Location -Path $projectPath

# Install TailwindCSS
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

# Remove bloat
Remove-Item -Path ".\pages\api" -Recurse
Remove-Item -Path ".\styles\Home.module.css"

# Overwrite default data (which gets rid of bloat within the code)
Set-Content -Path ".\tailwind.config.js" -Value (Get-TailwindConfig);
Set-Content -Path ".\styles\globals.css" -Value (Get-Globals);

# Replace .\pages\index based on whether the TypeScript flag was enforced or not
if ($enableTs -eq "") {
  Set-Content -Path ".\pages\index.js" -Value (Get-IndexPage)
} else {
  Set-Content -Path ".\pages\index.tsx" -Value (Get-IndexPage -typescript)
}

Set-Location -Path ".."