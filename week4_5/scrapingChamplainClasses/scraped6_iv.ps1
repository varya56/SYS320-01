. (Join-Path $PSScriptRoot scraped3.ps1)
. (Join-Path $PSScriptRoot scraped5.ps1)
$result = gatherClasses
#$result

$FullTable = daysTranslator($result)

$ITSInstructors = $FullTable | Where-Object {
($_."Class Code" -ilike "SYS*") -or
($_."Class Code" -ilike "NET*") -or
($_."Class Code" -ilike "SEC*") -or
($_."Class Code" -ilike "FOR*") -or
($_."Class Code" -ilike "CSI*") -or
($_."Class Code" -ilike "DAT*") 
} | Sort-Object "Instructor" | Select-Object "Instructor" -Unique

$FullTable | Where-Object {$_.Instructor -in $ITSInstructors.Instructor } | Group-Object "Instructor" | 
Select-Object Count, Name | 
Sort-Object Count -Descending