### Define Deployment Variables
fix templatepath and verify templatefile variables
{
$resourceGroupLocation = '[resource group location]'
$resourceGroupName = '[resource group name]'
$resourceDeploymentName = 'contoso-paas-deployment'
$templatePath = $env:SystemDrive + '\' + 'pluralsight'
$templateFile = 'contosoPaas_4.json'
$template = $templatePath + '\' + $templateFile
}

### Deploy Resources
{
New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -Verbose -Force
}