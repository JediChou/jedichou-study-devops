#
# File name: IISBackup.ps1
# Description: Use microsoft msdeploy.exe to backup all IIS Websites.
# Author: Jedi Chou
# Date: 2017.08.10 18:53
# Version: 0.0.1.0
# 

# Define variables
$MSDeployPath = $env:ProgramFiles + "\IIS\Microsoft Web Deploy\"
$MSDeployBin =  $MSDeployPath + "msdeploy.exe"
$CurrentPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

function GetBackupFileName()
{
    return ([string] (Get-Date -Format yyyyMMdd-HHmmss) + ".zip")
}

############################################################
# IIS Website Backup Process
if ((Test-Path $MSDeployPath) -and (Test-Path $MSDeployBin))
{
    # Step-1 Check path of msdeploy.exe and binary file exists.
    # Step-2 Get backup file name
    $CurrentPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
    $FileName = GetBackupFileName
    $BackupFileFullPath = $CurrentPath + "\" + $FileName
    
    # Step-3 Delete file if backup file exists.
    if (Test-Path $BackupFileFullPath)
    {
        del $BackupFileFullPath
        Write-Host "Delete old backup file."
    }

    # Step-4 If path does not contain msdeploy.exe path then add it
    if ($env:Path.Split(";") -contains $MSDeployPath)
    {
        $newPath =  $env:Path + ";" + $MSDeployPath
        [environment]::SetEnvironmentvariable("Path", $newPath)
    }

    # Step 5-1 Create msdeploy execute parameters
    $Para1 = "-verb:sync"
    $Para2 = "-source:webServer"
    $Para3 = "-dest:package='" + $BackupFileFullPath + "'"
    
    # Step 5-2 Execute backup operation
    .$MSDeployBin $Para1 $Para2 $Para3

    # Step 5-3
    Write-Host "Backup complete."
}
else
{
    # If msdeploy.exe do not installed, then quit execute.
    Write-Host "IIS MSDeploy tool does not exists."
    Write-Host "Program process finished."
}
