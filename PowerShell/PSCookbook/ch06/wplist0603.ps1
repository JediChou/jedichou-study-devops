# Author: Jedi Chou
# Date: 2016-7-2 11:59 AM
# Reference: Windows PowerShell应用手册.pdf, Page 122
# Description
#   问题1: 测量对象组成的一个列表中的数值或文本
#   问题2: 数值的最小,最大,求和,平均
#   问题3: 文本中的字符,单词等

# 获取对象流的数值特性
1..10 | Measure-Object -Average -Sum

# 获取对象流中的特定属性的数值特性
Get-ChildItem | Measure-Object -Property Length -Max -Min -Average -Sum

# 获取对象流的文本特性
Get-ChildItem > output.txt
Get-Content output.txt | Measure-Object -Character -Word -Line

## 使用Data Timer类中的Tisks属性来获取文件列表中LastWriteTime的平均值
$times = dir | ForEach-Object { $_.LastWriteTime }  ## Get the LastWriteTime from each
$result = $times | Measure-Object Ticks -Average    ## Measure the average Ticks property of those LastWriteTime
$output = New-Object DateTime $result.Average       ## Create a new DataTime outof the average Ticks
Write-Host $output