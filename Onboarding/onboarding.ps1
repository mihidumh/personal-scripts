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

param([string] $firstname)
param([string] $lastname)
param([string] $email)
param([string] $password)
param([string] $phone)

if ($password) {    
    Write-host "Password: " $password
}
else {
    Write-Host "Retrieving password from DinoPass."
    $password = Invoke-WebRequest -UseBasicParsing -URI "https://www.dinopass.com/password/simple"
    Write-host "DinoPass: " $password
}

