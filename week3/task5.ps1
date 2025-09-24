function getStartsShutDowns(){
Param(
[int]$Days = 14
)

$startsShutDowns = Get-EventLog system -After (Get-Date).AddDays(-$Days) | Where-Object {$_.EventId -in 6005, 6006 }
$startsShutDownsTable = @()

for($i=0; $i -lt $startsShutDowns.Count; $i++){
$event = ""
if($startsShutDowns[$i].EventId -eq 6006) {$event="Shutdown"}
if($startsShutDowns[$i].EventId -eq 6005) {$event="Start"}

$startsShutDownsTable += [pscustomobject]@{"Time" = $startsShutDowns[$i].TimeGenerated;
"Id" = $startsShutDowns[$i].EventId;
"Event" = $event;
"User" = "System";
}
}
return $startsShutDownsTable
}

#getStartsShutDowns -Days 14
