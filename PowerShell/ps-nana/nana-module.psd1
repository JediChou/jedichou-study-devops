@{
    GUID = "{f8dc9934-2c81-4430-9412-f00172bfaa87}"
    Author = "Jedi Chou"
    ModuleVersion = '0.0.1.2'
    PowerShellVersion = "2.0"
    ClrVersion = "4.0"
 
    NestedModules = 'get-cfafunction1.ps1','get-cfafunction2.ps1'

    TypesToProcess = @()
    FormatsToProcess = @()

    # CmdletsToExport = @(
    #    'Get-CFAFunction1',
	#	'Get-CFAFunction2'
    # )
	
	FunctionsToExport = 'get-cfafunction1','get-cfafunction2'
}