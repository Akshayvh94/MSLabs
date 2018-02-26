
### Define variables
{

$location = '[resource group location]'
$resourceGroupName = '[resource group name]'
$resourceDeploymentName = 'contoso-vault'
$keyVaultName = 'contoso-vault'
$password = 'C0nt0s0P@55'
$secretName = 'vmAdminPassword'

}

### Create Key Vault
{

New-AzureRmKeyVault `
    -VaultName $keyVaultName `
    -ResourceGroupName $resourceGroupName `
    -Location $location `
    -EnabledForTemplateDeployment

}

### Add Password to Key Vault
{

$adminPass = ConvertTo-SecureString `
    -String $password `
    -AsPlainText -Force

Set-AzureKeyVaultSecret `
    -VaultName $keyVaultName `
    -Name $secretName `
    -SecretValue $adminPass

}