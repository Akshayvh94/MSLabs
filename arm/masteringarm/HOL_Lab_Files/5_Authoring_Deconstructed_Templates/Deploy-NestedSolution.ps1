### Define variables
{

$location = '[resource group location]'
$resourceGroupName = '[resource group name]'
$resourceDeploymentSolutionName = 'contoso-arm-nested-deployment'
$templateBasePath = $env:SystemDrive + '\' + 'Users' + '\' + 'LabUser' + '\' + 'Documents' + '\' + 'HOL_Lab_Files' + '\' + '5_Authoring_Deconstructed_Templates' + '\' + 'nested'
$templateFile = 'azureDeploy_5.json'
$template = $templateBasePath + '\' + $templateFile
$templateParametersFile = 'azureDeploy_5.parameters.json'
$templateParameters = $templateBasePath + '\' + $templateParametersFile

}

### Get Subscription ID
{
(Get-AzureRmSubscription).SubscriptionId
}

### Deploy IaaS Solution
{

New-AzureRmResourceGroupDeployment `
    -Name $resourceDeploymentSolutionName `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile $template `
    -TemplateParameterFile $templateParameters `
    -Verbose -Force

}