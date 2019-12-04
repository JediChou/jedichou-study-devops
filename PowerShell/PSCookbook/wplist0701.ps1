# 文件名: wplist0701.ps1
# 作者: Jedi
# 日期: 2016.8.11 10:33 AM
# 來源:《Windows Powershell應用手冊》, P143

# 用Get-Content來獲得文件內容
$content = Get-Content wplist0701.ps1

# 這是Get-Content的另外一種寫法
$content = ${wplist0701.ps1}

# 用System.IO.File的靜態方法來調用
$content = [System.IO.File]::ReadAllText("D:\temp\codelab\ps-cookbook\wplist0701.ps1")

Write-Host $content