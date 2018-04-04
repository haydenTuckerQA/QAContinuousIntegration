#!/bin/bash
for X in {1..10}
do
	for Y in {1..10}
	do
		printf '%5s' $((X * Y))
	done
	printf "\n"
done
