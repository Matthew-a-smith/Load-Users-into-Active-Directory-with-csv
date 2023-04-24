# script name: users.py
# author: Matthew Smith
# created: 23/03/23

# imports / windows/ powershell
import csv
import os
import subprocess

# open csv file, user_load
csv_file = open('testfile.csv', "r")
# csv file defined, as users
users = csv.DictReader(csv_file)

# gathers info from  file into coulmns
for row in users:
    username = row['username']
    print(username, (str("sucsecfully added")))
    firstname = row['first name']
    #print(firstname)
    lastname = row['last name']
    #print(lastname)
    IDnum = row['ID number']
    #print(IDnum)
    
    # powershell command to creatre new users with values from row columns
    POWERcommand = f'New-ADUser -Name "{username}" -GivenName "{firstname}" -Surname "{lastname}" -SamAccountName "{IDnum}" -AccountPassword (ConvertTo-SecureString -String "password123!!" -AsPlainText -Force) -Enabled $True'
    # presents command to powershell and excutes it
    excute = subprocess.Popen(['powershell.exe', '-Command', POWERcommand], stdout=subprocess.PIPE)
    
    # captures stdout in bytes can be used to log or error handle but not neccsiary 
    #result = excute.communicate()[0]
    #print(result.decode('utf-8'))
