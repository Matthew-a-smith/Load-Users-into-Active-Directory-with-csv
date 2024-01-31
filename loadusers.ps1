$users = Import-Csv -Path C:\Users\Administrator\Desktop\testfile.csv

foreach ($user in $users) {
    $username = $user.username
    $firstname = $user.firstname
    $IDnumber = $user.IDnumber

    # Check if user already exists
    if (Get-ADUser -Filter {SamAccountName -eq $IDnumber}) {
        Write-Host "User $IDnumber already exists. Skipping..."
    }
    else {
        # Specify the OU for the user (update the DistinguishedName accordingly)
        $ouPath = "OU=YourUserOU,DC=yourdomain,DC=com"

        $pass = ConvertTo-SecureString -String "password123!!" -AsPlainText -Force

        # Create the new user without specifying a last name
        New-ADUser `
            -Name $username `
            -GivenName $firstname `
            -Surname "" `
            -SamAccountName $IDnumber `
            -AccountPassword $pass `
            -Enabled $True `
            -Path $ouPath
    }
}
