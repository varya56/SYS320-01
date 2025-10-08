. (Join-Path $PSScriptRoot ParsingApacheLogs.ps1)
. (Join-Path $PSScriptRoot String-Helper.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)

clear

$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 apache logs`n"
$Prompt += "2 - Display last 10 failed logins for all users`n"
$Prompt += "3 - Display at risk users`n"
$Prompt += "4 - Start Chrome web browser and navigate it to champlain.edu - if no instances of Chrome is running`n"
$Prompt += "5 - Exit`n"



$operation = $true

while($operation){

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if($choice -eq 5){
        Write-Host "Goodbye" | Out-String
        exit
        $operation = $false 
    }

    elseif($choice -eq 1){
       $apacheLogs = ApacheLogs1
        Write-Host ($apacheLogs | Select-Object -Last 10 | Format-Table | Out-String)
    }

    elseif($choice -eq 2){
        $numDays = Read-Host -Prompt "Please enter the number of days to search for log-ins/ofs"
        $userLogins = getFailedLogins $numDays
        Write-Host ($userLogins | Where-Object { $_.User -ilike "*$name"} | Format-Table | Out-String)
    }
    elseif($choice -eq 3){
    $numDays = Read-Host -Prompt "Please enter the number of days to search for users at risk"
    $failedLogins = getFailedLogins $numDays
    $atRiskUsers = $failedLogins | Group-Object User | Where-Object { $_.Count -gt 10 }
    if($atRiskUsers.Count -gt 0){
    Write-Host "At Risk Users:" | Out-String
    Write-Host ($atRiskUsers | Format-Table Name, Count | Out-String)
    }
    else{
    Write-Host "No users at risk found." | Out-String
    }
    }
    elseif($choice -eq 4){
    $chrome = Get-Process -Name "chrome" -ErrorAction SilentlyContinue
    if(!$chrome){
    Write-Host "Chrome is not running! Starting..."
    Start-Process "chrome.exe" -ArgumentList "https://www.champlain.edu/"
    }
    else{
    Write-Host "Chrome is running! Stopping..."
    Stop-Process -Name "chrome" -Force 
    }
    }
    else{
    Write-Host "Invalid choice." | Out-String
   }
 }
