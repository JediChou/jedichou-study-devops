Option Explicit

Dim objInfo
Set objInfo = CreateObject("ADSystemInfo")

WScript.Echo(objInfo.ComputerName)
WScript.Echo(objInfo.DomainDNSName)
WScript.Echo(objInfo.DomainShortName)
WScript.Echo(objInfo.ForestDNSName)
' WScript.Echo(IsNativeMode)	' Has not property
WScript.Echo(objInfo.
