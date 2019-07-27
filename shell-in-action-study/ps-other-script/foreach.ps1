Get-ChildItem -path env: | ForEach-Object {
	Write-Host $_.Name ":" $_.Value;
}
