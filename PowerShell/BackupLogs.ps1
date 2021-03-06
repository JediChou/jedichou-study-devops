# Get-EventLog -List
$e = Get-EventLog -newest 10 -LogName System

<#
Write-Host "Index:", $e[0].Index
Write-Host "Time:", $e[0].Time
Write-Host "Entry Type:", $e[0].EntryType
Write-Host "Source:", $e[0].Source
Write-Host "Instance ID:", $e[0].InstanceID
Write-Host "Message:", $e[0].Message
Write-Host $e.Length
#>

<#
foreach($log in $e) {
    #<#
    Write-Host "Index:", $log.Index
    Write-Host "Time:", $log.Time
    Write-Host "Entry Type:", $log.EntryType
    Write-Host "Source:", $log.Source
    Write-Host "Instance ID:", $log.InstanceID
    Write-Host "Message:", $log.Message
    ##>
    # Write-Host "Hello world"
#}
#>

<#
$EventLogEntryString = $e[0].Index.ToString() + ", "
$EventLogEntryString += $e[0].Time + ", "
$EventLogEntryString += $e[0].EntryType.ToString() + ", "

Add-Content -path e:\temp.txt $EventLogEntryString
# Get-Date -format "yyyy-MM-dd, HH:mm"
# [string
#>

Add-Content d:\temp.txt $e[0]
