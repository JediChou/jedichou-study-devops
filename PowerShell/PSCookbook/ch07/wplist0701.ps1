# ���W: wplist0701.ps1
# �@��: Jedi
# ���: 2016.8.11 10:33 AM
# �ӷ�:�mWindows Powershell���Τ�U�n, P143

# ��Get-Content����o��󤺮e
$content = Get-Content wplist0701.ps1

# �o�OGet-Content���t�~�@�ؼg�k
$content = ${wplist0701.ps1}

# ��System.IO.File���R�A��k�ӽե�
$content = [System.IO.File]::ReadAllText("D:\temp\codelab\ps-cookbook\wplist0701.ps1")

Write-Host $content