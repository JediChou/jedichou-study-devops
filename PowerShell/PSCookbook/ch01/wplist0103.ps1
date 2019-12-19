# Author: Jedi Chou
# Date: 2016-7-4 19:29 PM
# Reference: Windows PowerShell应用手册.pdf, Page 48
# Description
#   1.3 自定义shell、配置文件与提示符

# 1. PowerShell将脚本文件的地址存放在$profile变量中

# 2. 创建一个新的配置脚本（或者覆盖已经存在的配置脚本）
# New-Item -type file -force $profile

# 3. 编辑已经存在的配置脚本
# notepad $profile

# 4. 查看你的配置脚本文件的内容
# Get-ChildItem $profile

# 5. 添加一个名为Prompt的函数
# function Prompt
# {
#    "PS [$env:COMPUTERNAME] >"
# }

# 6. 设置别名
# Set-Alias new New-Object
# Set-Alias iexplore 'C:\Program Files\Internet Explorer\iexplore.exe'

# 7. 令Profile文件生效
# .$profile

# example 1-2 PowerShell提示符例子
# function Prompt
# {
#     $id = 1
#     $historyItem = Get-History -Count 1
#     if ($historyItem)
#     {
#         $id = $historyItem.Id + 1
#     }
#  
#     Write-Host -ForegroundColor DarkGray "`n[$(Get-Location)]"
#     Write-Host -NoNewline "PS:$id > "
#     $host.UI.RawUI.WindowTitle = "$(Get-Location)"
# 
#     "`b"
# }