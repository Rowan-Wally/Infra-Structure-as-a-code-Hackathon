#!/bin/bash
token=$(curl -X POST --header 'Content-Type: application/x-www-form-urlencoded' --header 'Accept: application/json' -d 'grant_type=password&username=rowan.wally&password=P@ssw0rd!1' 'https://backup1.cloudavenue.orange-business.com/NetBackupSelfServiceNetBackupPanels/Api/auth/token' |sed -n '/ *"access_token": *"/ {s///; s/".*//; p;} '))

curl --location --request GET 'https://backup1.cloudavenue.orange-business.com/NetBackupSelfServiceNetBackupPanels/Api/v6/machines/443/protection/levels' --header 'Content-Type: application/json' --header 'Accept: application/json'--header 'Authorization: Bearer $token' 
curl --location --request POST 'https://backup1.cloudavenue.orange-business.com/NetBackupSelfServiceNetBackupPanels/Api/v6/machines/443/protect' \
--header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: Bearer $token' --data-raw '{ "ProtectionLevelId": 2, "Paths": [ "string" ] }'

curl --location --request GET 'https://backup1.cloudavenue.orange-business.com/NetBackupSelfServiceNetBackupPanels/Api/v6/machines/445/protection/levels' --header 'Content-Type: application/json' --header 'Accept: application/json'--header 'Authorization: Bearer $token' 
curl --location --request POST 'https://backup1.cloudavenue.orange-business.com/NetBackupSelfServiceNetBackupPanels/Api/v6/machines/445/protect' \
--header 'Content-Type: application/json' --header 'Accept: application/json' --header 'Authorization: Bearer $token' --data-raw '{ "ProtectionLevelId": 2, "Paths": [ "string" ] }'
