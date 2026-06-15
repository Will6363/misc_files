#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    SELECT_FROM_ELEMENTS="$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE $1 = atomic_number")"
  else
    SELECT_FROM_ELEMENTS="$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE '$1' = symbol OR '$1' = name")"
  fi
  if ! [[ -z $SELECT_FROM_ELEMENTS ]]
  then
    IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME <<< $SELECT_FROM_ELEMENTS

    SELECT_PROPERTIES="$($PSQL "SELECT types.type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties inner join types using (type_id) where atomic_number = $ATOMIC_NUMBER")"
    IFS="|" read -r TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $SELECT_PROPERTIES
  
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  else
    echo "I could not find that element in the database."    
  fi 
fi