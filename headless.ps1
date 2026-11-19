#--configuration---
$VBoxManage = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
$ParrotVM = "Parrot HTB"
$KaliVM = "kali-linux-2026.1-vbox-amd64"

#---IP Address of the VMs---
$ParrotIP = "192.168.56.104"
$KaliIP = "192.168.56.102"

#---Start the VMs---
Start-Process -FilePath $VBoxManage -ArgumentList "startvm `"$ParrotVM`" --type headless"
Start-Process -FilePath $VBoxManage -ArgumentList "startvm `"$KaliVM`" --type headless"

#---Wait for the VMs to boot up---
Start-Sleep -Seconds 30

#---Test SSH connectivity to the VMs---
$ParrotReady = Test-NetConnection -ComputerName $ParrotIP -Port 22 -WarningAction SilentlyContinue
if (-not $ParrotReady.TcpTestSucceeded) {
    Write-Host "Warning: Parrot SSH ($ParrotIP) is not responding..." -ForegroundColor Red
}
$KaliReady = Test-NetConnection -ComputerName $KaliIP -Port 22 -WarningAction SilentlyContinue
if (-not $KaliReady.TcpTestSucceeded) {
    Write-Host "Warning: Kali SSH ($KaliIP) is not responding..." -ForegroundColor Red
}

#---Display the IP addresses of the VMs---
Write-Host "Parrot VM IP Address: $ParrotIP" -ForegroundColor Green
Write-Host "Kali VM IP Address: $KaliIP" -ForegroundColor Green

#--Open windows terminal labs---
Write-Host "Opening Windows Terminal for labs..." -ForegroundColor Green

$ParrotUser = "magatax"
$KaliUser = "kali"

#---Open Windows Terminal with SSH sessions to the VMs---
wt.exe -w 0 nt -p "Parrot SSH" ssh $ParrotUser@$ParrotIP; `
wt.exe -w 0 nt -p "Kali SSH" ssh $KaliUser@$KaliIP  

#---End of script---
