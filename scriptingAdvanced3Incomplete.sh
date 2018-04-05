#!/bin/bash

beatsRock () {
	if [ "$1" == "Paper" ]
	then
		echo 0
	else
		echo 1
	fi
}

beatsPaper () {
	if [ "$1" == "Scissors" ]
	then
		echo 0
	else
		echo 1
	fi
}

beatsScissors () {
	if [ "$1" == "Rock" ]
	then
		echo 0
	else
		echo 1
	fi
}

getPlayerMove () {
	playerMove=""
	
	while [ "$playerMove" != "Rock" ] && [ "$playerMove" != "Paper" ] && [ "$playerMove" != "Scissors" ]
	do
		echo "Enter Rock/Paper/Scissors"
		read playerMove
	done

	echo "Human Played: $playerMove"
	return $playerMove
}

getCompMove () {
	moves=("Rock" "Paper" "Scissors")
	compMove=${moves[$RANDOM % ${#moves[@]} ]}
	
	echo "Computer Played: $compMove"
	return $compMove
}

wins=0
losses=0
draws=0

isPlayAgain=0

while [ $isPlayAgain -eq 0 ]
do
	echo "Wins: $wins Losses: $losses Draws: $draws"
	isPlayerWin=1
	playerMove=$(getPlayerMove)
	compMove=$(getCompMove)

	case "$playerMove" in
	"Rock")
		isPlayerWin=$(beatsRock $compMove)
		;;
	"Paper")
		isPlayerWin=$(beatsPaper $compMove)
		;;
	"Scissors")
		isPlayerWin=$(beatsScissors $compMove)
		;;
	esac


	if [ "$compMove" == "$playerMove" ]
	then
		echo "It's a draw!"
		draws=$(($draws + 1))
	elif [ "$isPlayerWin" == "1" ]
	then
		echo "Player wins! $playerMove beats $compMove"
		wins=$(($wins + 1))
	elif [ "$isPlayerWin" == "0" ]
	then
		echo "Player loses! $playerMove loses to $compMove"
		losses=$(($losses + 1))
	fi

	echo "Enter Y if you'd like to play again!"
	read input

	if [ "$input" != "Y" ]
	then
		isPlayAgain=1
	fi
done

echo "Thanks for playing! Your final scores are below"
echo "Wins: $wins Losses: $losses Draws: $draws"
