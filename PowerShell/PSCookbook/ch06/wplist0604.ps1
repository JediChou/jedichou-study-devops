# Author: Jedi Chou
# Date: 2016-7-2 15:37 AM
# Reference: Windows PowerShell应用手册.pdf, Page 124
# Description
#   问题: 希望使用一个数的单个位或使用一系列的标志组合生成的数

## 16进制的数字
$hexNumber = 0x1234
Write-Host $hexNumber

## 显示二进制 
$decNumber = 2020
Write-Host ([Convert]::ToString($decNumber, 2))

## 将二进制转换为十进制
$binNumber = "100101011101010111100010"
$binToDec = [Convert]::ToInt32($binNumber, 2)
Write-Host $binToDec

