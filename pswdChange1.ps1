Connect-AzAccount
Set-AzVMAccessExtension -ResourceGroupName "ENTER YOUR RESOURCE NAME HERE" `
                        -VMName "ENTER YOUR VM NAME HERE" `
                        -Credential (get-credential -Message "Enter your NEW USERNAME and/or PASSWORD") `
                        -Name VMAccessAgent
Restart-AzVM