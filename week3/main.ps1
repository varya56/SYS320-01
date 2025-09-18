. (Join-Path $PSScriptRoot task4.ps1)
. (Join-Path $PSScriptRoot task5.ps1)
clear
 $loginoutsTable = getLoginLogouts -Days 15
 $loginoutsTable

 $getStartsShutDowns = getStartsShutDowns -Days 4
 $getStartsShutDowns