#!/bin/bash
curDate=$(date)
loggedInUsers=$(who)

echo "Enter Y if you would like to delete the current log file"
read input
if [ ${input} == "Y" ]
then
	sudo rm dateLoggedUsers.txt
	echo "Log deleted"
fi

echo "------"
echo "${curDate}" 
echo "${loggedInUsers}"
echo "------"

echo "------" >> dateLoggedUsers.txt
echo "Log Date: ${curDate}" >> dateLoggedUsers.txt
echo "Logged In Users" >> dateLoggedUsers.txt
echo "${loggedInUsers}" >> dateLoggedUsers.txt
