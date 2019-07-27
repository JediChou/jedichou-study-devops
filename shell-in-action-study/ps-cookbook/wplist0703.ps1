# 文件名: wplist0703.ps1
# 作者: Jedi
# 日期: 2017.10.28 12:34 PM
# 來源:《Windows Powershell應用手冊》, P147
# 來源: 例7-1: 获得被补丁程序修改的文件列表

cd $env:WINDIR
$parseExpression = "(.*): Destination:(.*) \((.*)\)"
$files = dir kb*.log -Exclude *uninst.log
$logContent = $files | Get-Content | Select-String $parseExpression
$logContent

# Issue: 在Win10专业版上是空输出
#  Name                           Value
#  ----                           -----
#  PSVersion                      5.1.15063.674
#  PSEdition                      Desktop
#  PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
#  BuildVersion                   10.0.15063.674
#  CLRVersion                     4.0.30319.42000
#  WSManStackVersion              3.0
#  PSRemotingProtocolVersion      2.3
#  SerializationVersion           1.1.0.1
