<#
  OReilly-Windows PowerShell Cookbook, 3rd edition
  Author: Lee Holmes
  Chaper 1.5 Invoke a Long-Running or Background Command 
  Problem:
    You want to invoke a long-running command on a local
    or remoe computer.
  Solution:
    Invoke the command as a Job to have Powershell run
    it in the background.
#>

Start-Job { while($true) { Get-Random; Start-Sleep 5} } -Name Sleeper
Receive-Job Sleeper
Stop-Job Sleeper