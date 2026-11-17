Import-Module ActiveDirectory 
$Hostname = $env:ComputerName 
$IP = ipconfig
$Domain = Get-ADDomain 
$Users = Get-ChildItem C:\Users