#! /bin/bash

PSQL="psql -t --username=freecodecamp --dbname=salon -A -c"

echo -e "\n~~~~~ MY SALON ~~~~~"
MAIN_MENU() {
  echo -e "\n$1"
  GET_SERVICES=$($PSQL "SELECT * FROM services")

  echo "$GET_SERVICES" | while IFS="|" read -r SERVICE_ID SERVICE_NAME;
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  if echo "$GET_SERVICES" | grep -q "^$SERVICE_ID_SELECTED|"
  then
    CUSTOMER_PHONE_MENU
  else
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
}

CUSTOMER_PHONE_MENU() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  GET_CUSTOMER_PHONE=$($PSQL "SELECT * from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $GET_CUSTOMER_PHONE ]]
  then
    CREATE_CUSTOMER_MENU
  else
    IFS='|' read -r CUSTOMER_ID, CUSTOMER_NAME <<< "$($PSQL "SELECT customer_id, name from customers where phone='$CUSTOMER_PHONE'")"
  fi
  CREATE_APPOINTMENT_MENU
}

CREATE_CUSTOMER_MENU() {
  echo -e "\nI don't have a record for that phone number, what's your name?"
  read CUSTOMER_NAME
  INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) values ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")
}

CREATE_APPOINTMENT_MENU() {
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  SERVICE_NAME="$($PSQL "SELECT name FROM services where service_id=$SERVICE_ID_SELECTED")"
  echo -e "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

MAIN_MENU "Welcome to My Salon, how can I help you?\n"