function createVms ($images, $vDash_appId){ 
    $resourcegroup = New-AzResourceGroup -Name "RG-$vDash_appId" -Location "East Us"
    $VN_name = "VN-$vDash_appId"
 
    # This command gets the credential object and saves it in the $credential variable
    $credential = Get-Credential

    # split the vdash and app id
    $vDash = $vDash_appId.split("-")[0]
    $app_Id = $vDash_appId.split("-")[1]

    # Create the virtual network
    $virtual_network = New-AzVirtualNetwork -Name $VN_name  `
                                            -Location 'East Us' `
                                            -ResourceGroupName $resourcegroup.ResourceGroupName `
                                            -AddressPrefix 10.0.0.0/16
    # Create a subnet
    # Azure deploys resources to a subnet within a virtual network, so you need to create a subnet
    Add-AzVirtualNetworkSubnetConfig    -Name default `
                                        -AddressPrefix 10.0.0.0/24 `
                                        -VirtualNetwork $virtual_network

    # Associate the subnet to the virtual network
    $virtual_network | Set-AzVirtualNetwork

    foreach($image in $images){
        # take the image type and year only(win2008) and replace Win with WS following naming convention
        $image_name = $image.SubString(0,7)-replace "Win", "WS"

        Write-Output("-------------------------------------------------------------------------")
        New-AzVM    -Name "$image_name-$app_Id" `
                    -ResourceGroupName $resourcegroup.ResourceGroupName `
                    -Image $image `
                    -Location "East Us" `
                    -credential $credential `
                    -VirtualNetworkName $VN_name `
                    -SubnetName "default"
                    # -Size "Standard_DS3_v2" `
                    
     }
    Write-Output("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
}

# insert your os images here as params ↓
$vmImages = @("Win2012Datacenter")
# insert your vdash-app_id here ↓ as params 
createVms $vmImages "test-123456"