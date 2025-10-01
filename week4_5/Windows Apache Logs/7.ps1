$A = Get-Content -Path C:\xampp\apache\logs\*.log | Select-String 'error'
$A[-5..-1]