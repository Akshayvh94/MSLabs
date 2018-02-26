function Start-ImmersionPostDeployScript {
    param(
        $Credentials,
        $TenantId,
        $Region,
        $UserEmail,
        $UserPassword,
        $resourceGroupName,
        $StorageAccountName
    )

    function AssignUserRole ($RoleDefinitionName) {
        Write-Verbose "Assigning role '$RoleDefinitionName' to $UserEmail"
        if(!(Get-AzureRmRoleAssignment -SignInName $UserEmail -resourceGroupName $resourceGroupName -RoleDefinitionName $RoleDefinitionName)) {
            New-AzureRmRoleAssignment -SignInName $UserEmail -resourceGroupName $resourceGroupName -RoleDefinitionName $RoleDefinitionName | Out-Null
        }
        else {
            Write-Warning "Role '$RoleDefinitionName' already assigned!"
        }
    }

    #Assign roles required for the current story
    AssignUserRole -RoleDefinitionName '[Hands-on Labs] Management Solutions Editor'

    #Add user to OMS HOL Readeronly AD security group
    Write-Verbose "Assigning user to OMS HOL Readonly AD Security Group" 
	$refObjectId=Get-AzureRmADUser -UserPrincipalName $UserEmail
	Add-AzureADGroupMember -ObjectId e279421f-9742-49d9-a6db-524c50b59512 -RefObjectId $refObjectId.Id
}