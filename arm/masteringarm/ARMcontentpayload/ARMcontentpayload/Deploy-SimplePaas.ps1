
### Define Deployment Variables
<# from original sample - delete before publishing
{

$resourceGroupName = 'contoso-simple-paas'
$resourceProviderNamespace = 'Microsoft.Web'
$resourceTypeName = 'sites'
$resourceGroupLocation = 'Australia Southeast'

$randomString = ([char[]]([char]'a'..[char]'z') + 0..9 | Sort-Object {Get-Random})[0..8] -join ''
$appNamePrefix = 'contoso'
$appServicePlanName = $appNamePrefix + $randomString
$webAppName = $appNamePrefix + $randomString

}#>

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

### Get ARM Provider Locations NOT NEEDED?
{

((Get-AzureRmResourceProvider `
    -ProviderNamespace "$resourceProviderNamespace").ResourceTypes | `
    Where-Object {$_.ResourceTypeName -eq "$resourceTypeName"}).Locations | `
    Sort-Object
}

### Create ARM Resource Group DELETE FROM FILE BEFORE PUBLISHING
<#{

New-AzureRmResourceGroup `
    -Name $resourceGroupName `
    -Location $resourceGroupLocation `
    -Verbose -Force
}#>

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