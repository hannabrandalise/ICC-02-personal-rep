Import-Module ActiveDirectory

# Path to the CSV file
$csvPath = "C:\Lab\lab18-users.csv"
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    # Construct full name and UPN
    $fullName = "$($user.FirstName) $($user.LastName)"
    $samAccountName = $user.Username
    $userPrincipalName = "$samAccountName@greenbloom.local"

    # Define the OU based on department
    $ouName = $user.Department
    $ouPath = "OU=$ouName,DC=greenbloom,DC=local"

    # Check if the OU exists; create it if it doesn't
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$ouName'" -ErrorAction SilentlyContinue)) {
        Write-Host "OU '$ouName' does not exist. Creating it..."
        New-ADOrganizationalUnit -Name $ouName -Path "DC=greenbloom,DC=local"
    }

    # Create the AD user
    try {
        New-ADUser `
            -Name $fullName `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -SamAccountName $samAccountName `
            -UserPrincipalName $userPrincipalName `
            -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) `
            -Enabled $true `
            -Path $ouPath `
            -ChangePasswordAtLogon $true

        Write-Host "User $fullName ($samAccountName) successfully created!" -ForegroundColor Green
	Write-Host " "
    }
    catch {
        Write-Host "Failed to create user $fullName ($samAccountName): $_" -ForegroundColor Red
    }
}
