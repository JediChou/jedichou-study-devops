$iplist = Get-WmiObject Win32_NetworkAdapterConfiguration | Select IPAddress
# Get-WmiObject Win32_NetworkAdapterConfiguration | Select IPAddress | Where-Object {$_.IPaddress -like "192.168*"}

foreach($ip in $iplist) {
    if($ip.IPAddress -ne ''){
        break
    } else {
        $temp = "'"
        $temp += $ip.ipaddress
        $temp += "'"
        Write-Host $temp
    }
}
