function deleteResourceGroup($RGName) {
    Remove-AzResourceGroup -Name $RGName
}


deleteResourceGroup "cBlancosRG"