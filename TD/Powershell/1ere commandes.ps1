#Services

Get-Help use
Get-Service
Get-Service "*win*"
Get-Service "win*" -Exclude "*defend*"
Get-Service -Name "win*" | Where-Object {$_.Status -eq "Stopped"}

#Processus

Get-Process

Start-Process "firefox"
Stop-Process -Name "firefox"