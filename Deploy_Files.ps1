<#	
    .Synopsis
      This powershell script copies files to a %PROGRAMFILES%\ORG directory.
    .NOTES
	  Created:   	August, 2020
	  Created by:	Phil Helmling, @philhelmling
	  Organization: VMware, Inc.
	  Filename:     Deploy_Files.ps1
	.DESCRIPTION
	  This powershell script copies icon files
	  
    .EXAMPLE
      powershell.exe -ep bypass -file .\Deploy_Files.ps1
#>
$current_path = $PSScriptRoot;
if($PSScriptRoot -eq ""){
    #PSScriptRoot only popuates if the script is being run.  Default to default location if empty
    $current_path = "C:\Temp";
}

#Copy Icons
$filespath = "$env:PROGRAMFILES\folder"
If(!(test-path $filespath)){
	New-Item -ItemType Directory -Force -Path $filespath
}
Copy-Item -Path "$current_path\Icons" -Destination $filespath -Force -Recurse

#Copy Screensaver
Copy-Item -Path "$current_path\Screensavers" -Destination $filespath -Force -Recurse

#Copy Templates
$filespath = "$env:APPDATA\Microsoft"
Copy-Item -Path "$current_path\Templates" -Destination $filespath -Force -Recurse
