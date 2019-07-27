# file: apb05.ps1
# description: 
#   \p{character class}
#  在由{字符类}指定的任何采用Unicode编码的组或块范围中的字符
# todo: 没弄明白！

# 匹配成功
Write-Host ("+" -match '\p{Sm}')

# 匹配失败
Write-Host ("-" -match '\p{Sm}')
Write-Host ("\r\n" -match '\p{Sm}')