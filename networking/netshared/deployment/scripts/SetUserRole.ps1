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
    
	# removed due to new security structure    AssignUserRole -RoleDefinitionName 'Network Contributor'
    AssignUserRole -RoleDefinitionName 'Network Watcher'
    AssignUserRole -RoleDefinitionName '[Hands-on Labs] Network Manager'    
}	
