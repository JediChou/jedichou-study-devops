# �ļ���: wplist0703.ps1
# ����: Jedi
# ����: 2017.10.28 12:34 PM
# ��Դ:��Windows Powershell�����փԡ�, P147
# ��Դ: ��7-1: ��ñ����������޸ĵ��ļ��б�

cd $env:WINDIR
$parseExpression = "(.*): Destination:(.*) \((.*)\)"
$files = dir kb*.log -Exclude *uninst.log
$logContent = $files | Get-Content | Select-String $parseExpression
$logContent

# Issue: ��Win10רҵ�����ǿ����
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
