<# Custom Script for Windows #>
$temploc = "D:\Temp"
If (!(Test-Path $TempLoc)) {New-Item $temploc -type directory}

$payload = "tdijhpayload.zip"
$contentpayload = "tdicontentpayload.zip"
$contentloc = "C:\Users\Default\Documents"

$SecurePasswordImport = $config.private.AdminPassword
$PasswordFile = "$TempLoc\tempoutput.txt"
$SecurePasswordImport | Out-File $Passwordfile

$Username = $config.public.vmLocalUserName          
$PlainPassword = $config.private.vmLocalUserPassword 
$Password = ConvertTo-SecureString $PlainPassword -AsPlainText -Force

$AdministratorPassword = Get-Content "$TempLoc\tempoutput.txt"
$AdministratorName = "contosoadmin"
$Computername = $env:computername
$domainname = "contoso"

$scriptName = $MyInvocation.MyCommand.Name
Start-Transcript -path "$TempLoc\$scriptName$(get-date -format "yyyyMMdd_hhmmsstt").log" -append

#Create User
$ADSIComp = [adsi]"WinNT://$Computername"
$NewUser = $ADSIComp.Children | ? {$_.SchemaClassName -eq 'User' -and $_.Name -eq $Username};
if (!$NewUser) {
  $NewUser = $ADSIComp.Create('User',$Username)
}

#Create password
$BSTR = [system.runtime.interopservices.marshal]::SecureStringToBSTR($Password)
$_password = [system.runtime.interopservices.marshal]::PtrToStringAuto($BSTR)

#Set password on account 
$NewUser.SetPassword(($_password))
$NewUser.SetInfo()

#Add user to Local Remote Desktop Users Group
$LocalGroup = [ADSI]"WinNT://$Computername/Remote Desktop Users,group"
$User = [ADSI]"WinNT://$Computername/$Username,user"
if (!($LocalGroup.Members() | ? {$_.Name() -eq $Username})) {  $LocalGroup.Add($User.Path)}

#Set account to never expire
$User.UserFlags.value = $user.UserFlags.value -bor 0x10000
$User.CommitChanges()

<#Unzip Payload Files - 0x14 Unzips silent and overwrites existing files#>
write-output "Unzip Payload Files"
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace("$temploc\$payload")
    foreach($item in $zip.items())
        {
        $shell.Namespace("$temploc").copyhere($item,0x14)
        }

<#Unzip Content Files - 0x14 Unzips silent and overwrites existing files#>
write-output "Unzip Content Files"
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace("$temploc\$contentpayload")
    foreach($item in $zip.items())
        {
        $shell.Namespace("$contentloc").copyhere($item,0x14)
        }

#Setting logon picture to block colour
  $registryPath = "HKLM:\Software\Policies\Microsoft\Windows\System"
  $Name = "DisableLogonBackgroundImage"
  $value = "1"
  IF(!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null}
  ELSE {
    New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWORD -Force | Out-Null
  }  

  #Cleanup 
  [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR) 
  Remove-Variable Password,BSTR,_password

  #Set AutoadminLogin and Run Once
  New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoAdminLogon -Value 1 -Force
  New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name AutoLogonCount -Value 1 -Force
  New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultUserName -Value "$($domainname)\$($administratorname)" -Force
  New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon' -Name DefaultPassword -Value $administratorpassword -Force

  $RunOnceKey = "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce"
set-itemproperty $RunOnceKey "NextRun" ('C:\Windows\System32\WindowsPowerShell\v1.0\Powershell.exe -executionPolicy Unrestricted -File ' + "$temploc\scripts\00_LogonContosoAdmin.ps1")

<# Reboot Server #>
write-output "Restart Server"
& shutdown /r /t 30 /f

stop-transcript
