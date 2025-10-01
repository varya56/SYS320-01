. (Join-Path $PSScriptRoot scraped3.ps1)
. (Join-Path $PSScriptRoot scraped5.ps1)
$result = gatherClasses
#$result

$FullTable = daysTranslator($result)

$FullTable | Where-Object{ ($_.Location -ilike "JOYC 310") -and ($_.days -ccontains "Monday") } |
Sort-Object "Time Start" | Select-Object "Time Start", "Time End", "Class Code"


