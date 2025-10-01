function getApacheLogs(){
param (
[string]$page,
[string]$httpCode,
[string]$webBrowser
)

$logs = Get-Content C:\xampp\apache\logs\access.log
$inputs = $logs | Select-String $page | Select-String $httpCode | Select-String $webBrowser
$regex = [regex] "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"
$ipsUnorganized = $regex.Matches($inputs)
$ips = @()
for($i=0; $i -lt $ipsUnorganized.Count; $i++){
$ips += [pscustomobject]@{"IP" = $ipsUnorganized[$i].Value;}
}
return $ips
}