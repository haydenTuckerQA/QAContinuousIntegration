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
		echo "$1: Enter Rock/Paper/Scissors" >&2
		read playerMove
	done
	echo $playerMove
}

getIsPlayerOneWin () {
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
	if [ "$2" == "$3" ]
	then
		echo "It's a draw!" >&2
		playerOneDraws=$(($playerOneDraws + 1))
		playerTwoDraws=$(($playerTwoDraws + 1))
	elif [ "$1" == "1" ]
	then
		echo "Player One wins! $2 beats $3" >&2
		playerOneWins=$(($playerOneWins + 1))
		playerTwoLosses=$(($playerTwoLosses + 1))
	elif [ "$1" == "0" ]
	then
		echo "Player Two wins! $3 beats $2" >&2
		playerOneLosses=$(($playerOneLosses + 1))
		playerTwoWins=$(($playerTwoWins + 1))
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

playerOneWins=0
playerTwoWins=0
playerOneLosses=0
playerTwoLosses=0
playerOneDraws=0
playerTwoDraws=0

isPlayAgain=0

while [ $isPlayAgain -eq 0 ]
do
	echo "Player One Wins: $playerOneWins Losses: $playerOneLosses Draws: $playerOneDraws"
	echo "Player Two Wins: $playerTwoWins Losses: $playerTwoLosses Draws: $playerTwoDraws"
	playerOneMove=$(getPlayerMove "Player One")
	playerTwoMove=$(getPlayerMove "Player Two")

	echo "Player One played: $playerOneMove"
	echo "Player Two played: $playerTwoMove"

	isPlayerOneWin=$(getIsPlayerOneWin $playerOneMove $playerTwoMove)

	updateScores $isPlayerOneWin $playerOneMove $playerTwoMove

	isPlayAgain=$(getIsPlayAgain)
done

echo "Thanks for playing! Your final scores are below"
echo "Player One Wins: $playerOneWins Losses: $playerOneLosses Draws: $playerOneDraws"
echo "Player Two Wins: $playerTwoWins Losses: $playerTwoLosses Draws: $playerTwoDraws"
