$templateFile = "azuredeploy.json"
New-AzResourceGroupDeployment `
  -Name blanktemplate `
  -ResourceGroupName BlancosRG `
  -TemplateFile $templateFile