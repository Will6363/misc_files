#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_MENU() {
  echo $1
  read GUESS

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_MENU "That is not an integer, guess again:"
  elif [[ $GUESS -gt $NUMBER ]]
  then
    ((NUMBER_OF_GUESSES++))
    GUESS_MENU "It's lower than that, guess again:"
  elif [[ $GUESS -lt $NUMBER ]]
  then
    ((NUMBER_OF_GUESSES++))
    GUESS_MENU "It's higher than that, guess again:"
  else
    ((NUMBER_OF_GUESSES++))
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
    INSERT_GAME=$($PSQL "INSERT INTO games(username, guesses) values ('$USERNAME', $NUMBER_OF_GUESSES)")
  fi
}

echo "Enter your username:"
read USERNAME

SELECT_NAME="$($PSQL "SELECT * FROM users WHERE username='$USERNAME'")"

if [[ -z $SELECT_NAME ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NAME="$($PSQL "INSERT INTO users values ('$USERNAME')")"
else
  SELECT_GAMES="$($PSQL "SELECT count(game_id), min(guesses) from games where username = '$USERNAME'")"
  IFS="|" read -r GAMES BEST <<< $SELECT_GAMES
  echo Welcome back, $USERNAME! You have played $GAMES games, and your best game took $BEST guesses.
fi

NUMBER=$(($RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0
GUESS_MENU "Guess the secret number between 1 and 1000:"