Import-Module ActiveDirectory 
<#
.DESCRIPTION
    Performs quick reconnaissance on the local machine.
.EXAMPLE
    Get-Recon
.NOTES
Remote Recon functions coming soon! This script serves as our initial introduction to writing functions and scripts and making powershell modules#>
function Get-Recon {
    #Collect the hostname of out PC

$Hostname = $env:ComputerName 
#Collect the IP address of our PC
$IP = ipconfig
#Collect the domain information
$Domain = Get-ADDomain 
#Collect the list of users who have logged in and built out a basic directory structure in C:\Users
$Users = Get-ChildItem C:\Users
#Create a new file to place our recon results in
New-Item .\.git\recon.txt -ItemType File -Force
#A variable to hold all of our recon information and then write it to the file we just created  
$Vars = "***--Hostname info---***, $Hostname, ***--IP info---***, $IP, ***--Domain info---***, $Domain, ***--Users info---***, $Users"
#It does the thing of writing the recon information to the file we created
Add-Content .\.git\recon.txt $Vars
}
Export-ModuleMember -Function Get-Recon -Variable Hostname