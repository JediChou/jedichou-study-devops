# PowerShell Script to backup the System log
$Log = "System"
$Location = "e:\"
$BackupLocation = $Location + "SystemLog.csv"
Get-Eventlog -LogName $Log | Export-Csv -path $BackupLocation –encoding "unicode"
