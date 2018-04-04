#!/bin/bash

isPrime() {
	i=2
	while [ ${i} -lt ${1} ]
	do
		if [ $((${1}%${i})) -eq 0 ]
		then
			return 1
		fi
		i=$((${i} + 1))
	done
	return 0
}

echo "Enter a number"
read end
start=1
for ((num=${start}; num<=${end}; num++))
do
	if isPrime ${num}
	then
		echo "Prime: ${num}"
	fi
done
