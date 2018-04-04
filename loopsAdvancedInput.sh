#!/bin/bash
echo "Enter a number to Fizz Buzz."
while read line
do
	echo "Enter a number to Fizz Buzz. Hit Ctrl + D to stop"
	X=("${X[@]}" $line)
done

for x in "${X[@]}"
do
	if [ $((x%3)) != 0 ] && [ $((x%5)) != 0 ]
	then
		printf "$x"
	else
		if [ $((x%3)) -eq 0 ]
		then
			printf "Fizz! "
		fi
	
		if [ $((x%5)) -eq 0 ]
		then
			printf "Buzz!"
		fi
	fi
	printf "\n"
done
