### Define Deployment Variables
{

$resourceGroupName = '[resource group name]'
$resourceProviderNamespace = 'Microsoft.Web'
$resourceTypeName = 'sites'
$resourceGroupLocation = '[resource group location]'

$randomString = ([char[]]([char]'a'..[char]'z') + 0..9 | Sort-Object {Get-Random})[0..8] -join ''
$appNamePrefix = 'contoso'
$appServicePlanName = $appNamePrefix + $randomString
$webAppName = $appNamePrefix + $randomString

}

### Create App Service Plan
{

$appServicePlan = New-AzureRmAppServicePlan `
    -ResourceGroupName $resourceGroupName `
    -Location $resourceGroupLocation `
    -Name $appServicePlanName `
    -Tier Standard `
    -WorkerSize Small `
    -Verbose
}

### Create Web App
{

New-AzureRmWebApp `
    -ResourceGroupName $resourceGroupName `
    -Location $resourceGroupLocation `
    -AppServicePlan $appServicePlan.ServerFarmWithRichSkuName `
    -Name $webAppName `
    -Verbose
}