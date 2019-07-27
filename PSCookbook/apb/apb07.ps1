# file: apb07.ps1
# description: \w 任何单词字符

# 匹配成功
Write-Host ("bee" -match '\w')
Write-Host ("up" -match '\w')
Write-Host ("may the force with you" -match '\w')

# 匹配失败
Write-Host ("~" -match '\w')
Write-Host ("!" -match '\w')
Write-Host (">" -match '\w')
Write-Host ("<" -match '\w')