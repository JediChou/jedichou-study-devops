# 文件名: list0702.ps1
# 搜索文件中的文本
# 参考：《PowerShell应用手册》, Page161

# 在sample中查找字符串Jedi
$result = Select-String -Simple Jedi sample.txt
Write-Host $result
# Notice: 这里可以匹配多行，所以可以用来写个简单的检索