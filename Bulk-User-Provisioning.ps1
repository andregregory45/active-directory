<#
.DESCRIPTION
    This script creates random user accounts to simulate a large-scale corporate 
    environment for testing and GPO application.
    
.NOTES
    Original Author: https://github.com/joshmadakor1
    Source: https://github.com/joshmadakor1/AD_PS/blob/master/Generate-Names-Create-Users.ps1
    Modified by: Andre Gregory
    Date Modified: February 6, 2026
    Changes: Fixed "$firstName" variable typo and adjusted the number of accounts for simplicity.
#>

# ----- Edit these variables for your own use case ----- #
$PASSWORD_FOR_USERS   = "Password1"
$NUMBER_OF_ACCOUNTS_TO_CREATE = 1000
# ------------------------------------------------------ #

Function generate-random-name() {
    $consonants = @('b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','z')
    $vowels = @('a','e','i','o','u','y')
    $nameLength = Get-Random -Minimum 3 -Maximum 7
    $count = 0
    $name = ""

    while ($count -lt $nameLength) {
        if ($($count % 2) -eq 0) {
            $name += $consonants[$(Get-Random -Minimum 0 -Maximum $($consonants.Count - 1))]
        }
        else {
            $name += $vowels[$(Get-Random -Minimum 0 -Maximum $($vowels.Count - 1))]
        }
        $count++
    }
    return $name
}

$count = 1
while ($count -lt $NUMBER_OF_ACCOUNTS_TO_CREATE) {
    # Debugged: Fixed variable typo ($firstName) to ensure correct AD attribute mapping
    $firstName = generate-random-name
    $lastName = generate-random-name
    $username = $firstName + '.' + $lastName
    $password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

    Write-Host "Creating user: $($username)" -BackgroundColor Black -ForegroundColor Cyan
    
    New-AdUser -AccountPassword $password `
               -GivenName $firstName `
               -Surname $lastName `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_EMPLOYEES,$(([ADSI]'').distinguishedName)" `
               -Enabled $true
    $count++

}
