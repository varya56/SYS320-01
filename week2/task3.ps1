Get-Service | Where-Object { $_.Status -eq "Stopped" } | Sort-Object Name | Export-Csv -Path "stoppedServices.csv" -NoTypeInformation
