#!/bin/bash
X=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30)
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
