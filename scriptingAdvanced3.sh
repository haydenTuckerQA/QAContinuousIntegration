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
		echo "Enter Rock/Paper/Scissors" >&2
		read playerMove
	done

	echo "Human Played: $playerMove" >&2
	echo $playerMove
}

getCompMove () {
	moves=("Rock" "Paper" "Scissors")
	compMove=${moves[$RANDOM % ${#moves[@]} ]}
	
	echo "Computer Played: $compMove" >&2
	echo $compMove
}

getIsPlayerWin () {
	case "$1" in
	"Rock")
		isPlayerWin=$(beatsRock $2)
		;;
	"Paper")
		isPlayerWin=$(beatsPaper $2)
		;;
	"Scissors")
		isPlayerWin=$(beatsScissors $2)
		;;
	esac
	echo $isPlayerWin
}

updateScores () {
	if [ "$compMove" == "$playerMove" ]
	then
		echo "It's a draw!" >&2
		draws=$(($draws + 1))
	elif [ "$isPlayerWin" == "1" ]
	then
		echo "Player wins! $playerMove beats $compMove" >&2
		wins=$(($wins + 1))
	elif [ "$isPlayerWin" == "0" ]
	then
		echo "Player loses! $playerMove loses to $compMove" >&2
		losses=$(($losses + 1))
	fi
}

getIsPlayAgain () {
	echo "Enter Y if you'd like to play again!" >&2
	read input

	if [ "$input" != "Y" ]
	then
		echo 1
	else
		echo 0
	fi
}

wins=0
losses=0
draws=0

isPlayAgain=0

while [ $isPlayAgain -eq 0 ]
do
	echo "Wins: $wins Losses: $losses Draws: $draws"
	playerMove=$(getPlayerMove)
	compMove=$(getCompMove)

	isPlayerWin=$(getIsPlayerWin $playerMove $compMove)

	updateScores $isPlayerWin

	isPlayAgain=$(getIsPlayAgain)
done

echo "Thanks for playing! Your final scores are below"
echo "Wins: $wins Losses: $losses Draws: $draws"
