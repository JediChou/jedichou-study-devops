# file: abp01.ps1
# description: 除了换行符之外的任何字符。

# 普通的匹配
Write-Host ("T" -match '.')
Write-Host ("Something" -match ".")

# 注意这样的匹配返回是true
Write-Host ("\n" -match ".")
Write-Host ("\r\n" -match ".")

# 这样的匹配返回才是false
$contents = "
"
Write-Host ($content -match ".")