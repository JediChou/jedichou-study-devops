# File: foreach.ps1
# Description: Powershell for each demo
# Review at 2019.12.19 11:48 by Jedi Chou

Get-ChildItem -path env: | ForEach-Object {
	Write-Host $_.Name ":" $_.Value;
}