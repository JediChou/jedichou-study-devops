# file: apb07.ps1
# description: \W 任何非单词字符

# 匹配成功
Write-Host ("~" -match '\W')
Write-Host ("!" -match '\W')
Write-Host (">" -match '\W')
Write-Host ("<" -match '\W')

# 匹配失败
Write-Host ("bee" -match '\W')
Write-Host ("up" -match '\W')
Write-Host ("may" -match '\W')