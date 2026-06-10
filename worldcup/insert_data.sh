#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

  > unique_teams.txt
  > unique_games.txt
  {
  read
  while IFS="," read -r YEAR ROUND WINNER OPP WIN_GOALS OPP_GOALS
    do 
      if [[ ! -z $YEAR ]]
      then
      #Build unique_teams.txt
        echo "('$WINNER')" >> unique_teams.txt
        echo "('$OPP')" >> unique_teams.txt
      #Build unique_games.txt
        echo "($YEAR, '$ROUND', '$WINNER', '$OPP', $WIN_GOALS, $OPP_GOALS)" >> unique_games.txt
      fi
    done
  } < games.csv
  sort -u unique_teams.txt -o unique_teams.txt
  paste -sd ',' unique_teams.txt > oneline_teams.txt

LIST_OF_TEAMS=$(head -n 1 oneline_teams.txt)
INSERT_TEAMS=$($PSQL "INSERT INTO teams(name) values $LIST_OF_TEAMS")

TEAMS_IDS=$($PSQL "SELECT * FROM teams")
while IFS='|' read -r ID NAME;
do
  sed -i "s/$NAME/$ID/g" unique_games.txt
done <<< $TEAMS_IDS

paste -sd ',' unique_games.txt > oneline_games.txt
LIST_OF_GAMES=$(head -n 1 oneline_games.txt)
INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values $LIST_OF_GAMES")
