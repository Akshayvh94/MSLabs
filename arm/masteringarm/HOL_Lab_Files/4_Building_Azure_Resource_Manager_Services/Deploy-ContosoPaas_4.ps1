### Define Deployment Variables
{
$resourceGroupLocation = '[resource group location]'
$resourceGroupName = '[resource group name]'
$resourceDeploymentName = 'contoso-paas-deployment'
$templatePath = $env:SystemDrive + '\Users\LabUser\Documents\HOL_Lab_Files\4_Building_Azure_Resource_Manager_Services'
$templateFile = 'contosoPaas.json'
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