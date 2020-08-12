$path = "C:";
$Installed = 0;
$todetect = "$env:USERPROFILE\Desktop\Private.lnk"

if(!(Test-Path $todetect)) {
    $Installed = 1
}
if($Installed -eq 0){ exit 0}
elseif($Installed -eq 1) {exit 1}