# 文件名: list0702_02.ps1
# 过滤办公电话
# 参考：《PowerShell应用手册》, Page161

$result = Select-String "\(...\) ...-..." .\phones.txt   # filter
Write-Host "Total office numbers:", $result.Count, "`n"  # output total number
foreach ($item in $result) {
    Write-Host $item.LineNumber, $item.line              # write item's line number and content
}