# File: truncate.ps1
# From: Windows PowerShell Cookbook, zh-cn version, Page 144
# Description: Use PowerShell to execute a calculate.
#
# PSVersion 5.1.16299.1146
# PSEdition Desktop

$result = 3/2
Write-Host $result
Write-Host ([Math]::Truncate($result))
