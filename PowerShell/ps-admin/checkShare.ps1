<#
 .SYNOPSIS
   checkShare
 .DESCRITPION
   List network share directory.
 .NOTES
   Author   : Jedi Chou
   Requires : Powershell Version 1.0
#>

Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceId='H:'"
