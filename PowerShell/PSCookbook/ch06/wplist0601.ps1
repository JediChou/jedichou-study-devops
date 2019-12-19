# Author: Jedi Chou
# Date: 2016-7-2 10:53 AM
# Reference: Windows PowerShell应用手册.pdf, Page 118
# Description
#   问题: 希望使用PowerShell来进行简单的数学计算

# Sample 1
$result1 = 0
$result1 = 3/2  # PowerShell support widening
Write-Host "Output result1" $result1

# Sample 2
$result2 = 0
$result2 = [int] (3/2)  # PowerShell use banker's rounding
Write-Host "Output result1" $result2

# Sample 3
$result3 = 3/2
Write-Host "Output result1" ([Math]::Truncate($result3))  # PowerShell执行截断操作
