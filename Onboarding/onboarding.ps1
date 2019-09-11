param(
    $firstname,
    $lastname,
    $email,
    $password,
    $phone,
    $APtemplate = 2906
)

<########################
** File: onboarding.ps1  
** Name: Onboarding Main Script
** Desc: Onboards users.
** Auth: Mihidum Hettiyahandi
** Date: 2019-09-11
**************************
** Change History
**************************
** PR   Date          Author   Description 
** --   --------     -------   ------------------------------------
** 1    2019-09-11   Mihidum   Initial DinoPass
**************************
** Instructions
**************************
** Run
########################>



# Determine script location for PowerShell
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

$APtoken = Get-Content $scriptDir\assetpanda.config
Write-host "AssetPanda Token: " $APtoken
$APheader = @{Authorization='Bearer '+$APtoken}

if ($password) {    
    Write-host "Password: " $password
}
else {
    Write-Host "Retrieving password from DinoPass."
    $password = Invoke-WebRequest -UseBasicParsing -URI "https://www.dinopass.com/password/simple"
    Write-host "DinoPass: " $password
}

$storage = Invoke-WebRequest -UseBasicParsing -URI "https://api.assetpanda.com:443//v2/users/storage" -Headers $APheader | ConvertFrom-JSON

write-host $storage

