$chrome = Get-Process -Name "chrome" -ErrorAction SilentlyContinue
if(!$chrome){
 Write-Host "Chrome is not running! Starting..."
 Start-Process "chrome.exe" -ArgumentList "https://www.champlain.edu/"
}
else{
 Write-Host "Chrome is running! Stopping..."
 Stop-Process -Name "chrome" -Force 
}