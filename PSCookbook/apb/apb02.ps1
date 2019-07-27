# file: apb02.ps1
# descripiton: 可选匹配

# 成功的匹配
Write-Host ("Bee" -match "[aeiou]")
Write-Host ("Jedi" -match "[aeiou]")
Write-Host ("Becky" -match "[aeiou]")

# 失败的匹配
Write-Host Fail Match: ("TTT" -match "[aeiou]")
Write-Host Fail Match: ("Fly" -match "[aeiou]")
Write-Host Fail Match: ("TK48" -match "[aeiou]")