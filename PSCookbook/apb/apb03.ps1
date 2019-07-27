# file: apb03.ps1
# description: 不包含的匹配，相当于[aeiou]的结果取反

# 匹配的操作
Write-Host ("TTT" -match "[^aeiou]")
Write-Host ("KKK" -match "[^aeiou]")
Write-Host ("GKG" -match "[^aeiou]")

# 不匹配的操作
Write-Host ("Jedi" -match "[aeiou]")
Write-Host ("CiCi" -match "[aeiou]")
Write-Host ("Becky" -match "[aeiou]")