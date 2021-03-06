<#
    File name: wpc-0101.ps1
    Reference:
        Windows PowerShell Cookbook 2nd - 1.1
    Problem:
        You rely on a lot of effort invested in your current tools. You have
        traditional executeables, Perl scripts, VBScript, and of course, a
        legacy build system that has organically grown into a tangled mess
        of batch files. You want to use PowerShell, but you don't want to 
        give up every you alreay have.
    Solution:
        1 - &'C:\Program Files\Program\Program.exe' arguments
        2 - .\Program.exe arguments
        3 - & '.\Program With Spaces.exe' arguments
#>

& 'C:\Windows\system32\CMD.exe'