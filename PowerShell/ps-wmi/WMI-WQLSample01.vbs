''''''''''''''''''''''''''''''''''''''''
' File name: WMI-WQLSample01.vbs
' Description: Give a WMI test sample
' Author: Internet
' Modify: Jedi Chou
' Date/Time: 2013-1-24 15:04
' Reference:
'   Sams VBScript WMI and ADSI Unleashed
'   Author: Don Jones
''''''''''''''''''''''''''''''''''''''''

On Error Resume Next

' Initial variables
Dim strComputer
Dim objWMIService
Dim colItems

' Set variable and use WQL to get printer informations
strComputer = "."
Set objWMIService = GetObject( "winmgmts:\\" & strComputer & "\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select * from Win32_Printer",, 48)

' Output printer caption
For Each objItem in colItems
	WScript.Echo "Caption: " & objItem.Caption
Next

