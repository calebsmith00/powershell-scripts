# Usage
##### *(Optional) - Add extracted directory to PATH to run command without manually accessing its path.*

1. Extract the directory some place you will remember
	*Example* - C:\Users\User\PSScripts
2. Using PowerShell, navigate to the script's directory
	`cd C:\Users\User\PSScripts\better_next_app` **OR** if you added the directory to PATH, you can call the command directly with `better_next_app`

# Flags
-dir <PATH> [currently broken]
	OPTIONAL - this will default to the current directory
	PATH - the root path that the next JS project will be created in

-projectName <NAME> 
	OPTIONAL - this will default to "untitledProject"
	NAME - a string that tells the script what project name to pass to create-next-app

-typescript **OR** -ts
	OPTIONAL
	If this flag is detected, it will initialize a NextJS project with a TypeScript template
	
