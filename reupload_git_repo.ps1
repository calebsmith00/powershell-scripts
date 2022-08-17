$dirName = Read-Host "Enter a target directory name"
cd "./$dirName"

Write-Host "Target directory: $dirName"

$repoUrl = "https://github.com/minifiedcode/$dirName.git"

git remote remove origin
git remote add origin $repoUrl
git branch -M main
git push -u origin main

cd "../"