# open csv file / built in csv module for powershell
$users = Import-Csv -Path C:\Users\Administrator\Desktop\testfile.csv
# Loops thru file and saves each row result to respectful Var groups. Username, first , lastname, IDnum
foreach ($user in $users) {
    $username = $user.username
    $firstname = $user.firstname
    $lastname = $user.lastname
    $IDnumber = $user.IDnumber
# Powershell command to add users to ac directory with inputs from csv file.
$pass = ConvertTo-SecureString -String "password123!!" -AsPlainText -Force
New-ADUser `
-Name $username `
-GivenName $firstname `
-Surname $lastname `
-SamAccountName $IDnumber `
-AccountPassword $pass `
-Enabled $True `
}

# note script dosent count for missing spaces I mannuly changed the row names to include none.