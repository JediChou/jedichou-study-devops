# Author: Jedi Chou
# Date: 2016-7-2 10:53 AM
# Reference: Windows PowerShell应用手册.pdf, Page 120
# Description
#   问题: 希望使用PowerShell来进行更复杂的计算或高级的数学运算

Write-Host ([Math]::Abs(-10.6))  # 绝对值
Write-Host ([Math]::Pow(123,3))  # 计算平方
Write-Host ([Math]::Sqrt(100))   # 计算开方
Write-Host ([Math]::Sin([Math]::PI / 2))  # 计算一个角度的Sin值

# 计算其他的三角函数的值
$var = [Math]::PI / 6
Write-Host ([Math]::Asin($var))
Write-Host ([Math]::Acos($var))
Write-Host ([Math]::Atan($var))

# 计算一个数字的任意根
function root($number, $root) { [Math]::Exp($([Math]::Log($number) / $root)) }
Write-Host (root 64 3)  # 注意这里的函数调用方式
Write-Host (root 25 5)
Write-Host ([Math]::Pow(1.90365393871588, 5))  # 其他例子
Write-Host ([Math]::Pow($(root 25 5), 5))

# 使用度而不是弧度为单位
function Convert-RadiansToDegress($angle) { $angle / (2 * [Math]::PI) * 360 }
function Convert-DegressToRadians($angle) { $angle / 360 * (2 * [Math]::PI) }
Write-Host $(Convert-RadiansToDegress ([Math]::PI))
Write-Host $(Convert-RadiansToDegress ([Math]::PI/2))
Write-Host $(Convert-DegressToRadians 360)
Write-Host $(Convert-DegressToRadians 45)
Write-Host $( [Math]::Tan($(Convert-DegressToRadians 45)) )