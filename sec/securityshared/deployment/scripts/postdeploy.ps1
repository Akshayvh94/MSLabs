function Start-ImmersionPostDeployScript {
    param(
        $Credentials,
        $TenantId,
        $Region,
        $UserEmail,
        $UserPassword,
        $ResourceGroupName,
        $StorageAccountName
    )

    function AssignUserRole ($RoleDefinitionName) {
        Write-Verbose "Assigning role '$RoleDefinitionName' to $UserEmail"
        if(!(Get-AzureRmRoleAssignment -SignInName $UserEmail -ResourceGroupName $ResourceGroupName -RoleDefinitionName $RoleDefinitionName)) {
            New-AzureRmRoleAssignment -SignInName $UserEmail -ResourceGroupName $ResourceGroupName -RoleDefinitionName $RoleDefinitionName | Out-Null
        }
        else {
            Write-Warning "Role '$RoleDefinitionName' already assigned!"
        }
    }

    #Add user into TDI Account
    $AADUser = Get-MsolUser -UserPrincipalName $UserEmail
    $TDIGroup = Get-MsolGroup | Where-Object {$_.DisplayName -eq "TDI_OMSUsers"}
    Add-MsolGroupMember -groupObjectid $TDIGroup.ObjectId -GroupMemberType "User" -GroupMemberObjectId $AADUser.ObjectId -ErrorAction SilentlyContinue

    $TDIGroup = Get-MsolGroup | Where-Object {$_.DisplayName -eq "TDI_KeyVaultAdmins"}
    Add-MsolGroupMember -groupObjectid $TDIGroup.ObjectId -GroupMemberType "User" -GroupMemberObjectId $AADUser.ObjectId -ErrorAction SilentlyContinue

    $TDIGroup = Get-MsolGroup | Where-Object {$_.DisplayName -eq "TDI_BackupUsers"}
    Add-MsolGroupMember -groupObjectid $TDIGroup.ObjectId -GroupMemberType "User" -GroupMemberObjectId $AADUser.ObjectId -ErrorAction SilentlyContinue

    # Remove any resource locks created by Azure Dev Test labs
    Get-AzureRMResourceLock -ResourceGroupName $ResourceGroupName | Remove-AzureRmResourceLock -Force


}