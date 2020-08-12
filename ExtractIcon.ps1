<#
.SYNOPSIS
ExtractIcon extracts the icon image from an exe file and saves it as a .ico file in the same directory as the .exe file.
.PARAMETER folder
The directory containing the .exe files.
.EXAMPLE
ExtractIcon -folder c:\exelocation
#>
Param ( 
    [Parameter(Mandatory=$true)]
    [string]$folder
)

[System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')  | Out-Null

dir $folder *.exe -ea 0 -rec |
  ForEach-Object { 
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($_.FullName)
    Write-Progress "Extracting Icon" $baseName
    [System.Drawing.Icon]::ExtractAssociatedIcon($_.FullName).ToBitmap().Save("$folder\$BaseName.ico")
}