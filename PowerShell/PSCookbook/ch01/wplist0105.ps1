# Author: Jedi Chou
# Date: 2016-7-4 20:27 PM
# Reference: Windows PowerShell应用手册.pdf, Page 52
# Description
#   1.5 希望学习特定命令是如何工作的，以及如何使用

# 1. 帮助中主要包括命令的大纲、语法以及细节描述
Clear
Get-Help Get-ChildItem

# 2. <1>另外一种方法
Clear
Get-ChildItem -?

# 3. 如果想获得一个特定命令帮助信息的详情
Clear
Get-Help Get-Acl -Detailed

# 4. 想获得一个特定命令的详细信息
Clear
Get-Help Get-Content -Full

# 5. 获得一个特定命令的例子信息
Clear
Get-Help Get-Process -Examples

# 6. 如果希望列出cmdlets的使用大纲，运行下面的命令
Clear
Get-Help * | Select-Object Name, Synopsis | Format-Table -Auto