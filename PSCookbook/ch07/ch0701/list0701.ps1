# 文件名: list0701.ps1
# 获取文件内容
# 参考：《PowerShell应用手册》, Page159

$content = Get-Content d:\temp\lab20180326-1056am.c
Write-Host $content