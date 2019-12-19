# Author: Jedi Chou
# Date: 2016-7-4 20:50 PM
# Reference: Windows PowerShell应用手册.pdf, Page 54
# Description
#   1.6 编程：搜索帮助

################################################################
## Search-Help.ps1
##
## Search the PowerShell help documentation for a given
## keyword or regular expression.
##
## Example:
##     Search-Help hashtable
##     Search-Help "(datetime|ticks)"
################################################################

param($pattern = $(throw "Please specify content to search for"))

$helpNames = $(Get-Help * | Where-Object { $_.Category -ne "Alias"})

foreach ($helpTopic in $helpNames)
{
    $content = Get-Help -Full $helpTopic.Name | Out-String
    if ($content -match $pattern)
    {
        $helpTopic | Select-Object Name, Synopsis
    }
}