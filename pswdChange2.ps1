$resGroup = Read-Host 'What is your resource group?'
$vmname = Read-Host 'What is your vmname?'
Set-AzVMAccessExtension -ResourceGroupName $resGroup -VMName $vmname -Credential (get-credential) -Name VMAccessAgent

