# file: apb06.ps1
# description: 
#   \P{character class}
#  不在由{字符类}指定的任何采用Unicode编码的组或块范围中的字符
# todo: 没弄明白！

# 匹配成功
Write-Host ("+" -match '\P{Sm}')