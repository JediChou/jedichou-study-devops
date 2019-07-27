# 文件名: list0701_3.ps1
# 使用.net对象来获取文件内容
# 参考：《PowerShell应用手册》, Page159

$content = [System.IO.File]::ReadAllText("d:\temp\lab20180326-1056am.c")

# Notice: 注意这里的输出带有换行符，前面连个脚本则没有
Write-Host $content