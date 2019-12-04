# file: apb07.ps1
# description: \s 任何非空白字符

# 匹配成功
Write-Host (" " -match '\s')
Write-Host ("`t" -match '\s')
Write-Host ("`r" -match '\s')

# 匹配失败
Write-Host ("bee" -match '\s')
Write-Host ("up" -match '\s')
Write-Host ("may" -match '\s')