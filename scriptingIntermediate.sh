#!/bin/bash
echo "Enter a username!"
read username
echo "Enter a password for ${username}"
read password

sudo useradd ${username}
echo "User: ${username} created"

echo "${username}:${password}" | sudo chpasswd
echo "Password has been set for ${username}"

if grep -q ${username} /etc/passwd
then
	echo "User exists"
else
	echo "User does not exist"
fi
