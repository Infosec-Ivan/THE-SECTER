#!/bin/bash

# Check if password is set
if [ -z $(cat ~/.password 2> /dev/null) ]; then
  # If not, prompt user to set a new password
  read -s -p "Set a password for access: " new_password
  echo "$new_password" > ~/.password
  echo "Password set. Please run the script again to access."
  exit
fi

# Function to handle Ctrl+C
ctrl_c() {
  echo
  echo "Use 'exit' to quit the script."
}

# Trap Ctrl+C to prevent interruption
trap ctrl_c INT

# Infinite loop for password prompt
while true; do
  read -s -p "Enter password for access: " password
  if [[ $password == $(cat ~/.password) ]]; then
    echo "Access granted"
    break
  else
    echo "Access denied"
  fi
done

# Clear the screen and display system info
clear
neofetch