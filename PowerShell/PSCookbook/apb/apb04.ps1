# file: apb04.ps1
# description: [start-end]，匹配在start-end之间的字符

# 匹配成功
Write-Host "Match result:" ("Test" -match "[e-t]")
Write-Host "Match result:" ("Most" -match "[e-t]")
Write-Host "Match result:" ("Very" -match "[e-t]")

# 匹配失败
Write-Host "Match result:" ("AAAA" -match "[e-t]")
Write-Host "Match result:" ("ABAB" -match "[e-t]")
Write-Host "Match result:" ("ABCD" -match "[e-t]")