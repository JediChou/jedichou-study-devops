# Author: Jedi Chou
# Date: 2016-7-4 19:45 PM
# Reference: Windows PowerShell应用手册.pdf, Page 51
# Description
#   1.4 查找实现指定任务的命令

Clear

# 1. 如果想要获得指定命令的概要信息
Get-Command Get-ChildItem

# 2. 获得命令的详细信息
Get-Command Get-ChildItem | Format-List

# 3. 想搜索包括"text"的所有命令，可用通配符来查询
Get-Command *text*

# 4. 搜索所有使用Get动词的命令，在-Verb后输入参数Get
Get-Command -Verb Get

# 5. 如果想搜索所有与服务有关的命令，在-Noun后加入参数Service
Get-Command -Noun Service