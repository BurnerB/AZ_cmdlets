Connect-AzAccount
Set-AzVMAccessExtension -ResourceGroupName "ENTER YOUR RESOUCE NAME HERE" -VMName "ENTER YOUTR VM NAME HERE" -Credential (get-credential) -Name VMAccessAgent
