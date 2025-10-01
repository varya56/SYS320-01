. (Join-Path $PSScriptRoot Apache-Logs.ps1)

$result = getApacheLogs -page index.html -httpCode "404" -webBrowser "Chrome"
$result