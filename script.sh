#!/bin/bash

read -p "Conform Installation (yes/no): " lol
if [[ $lol == "yes" ]]
then
echo -n "" > ~/../usr/etc/motd
echo -e '\n\n# Password protection script\n\n#!/bin/bash\n\n# Check if password is set\nif [ -z $(cat ~/.password 2> /dev/null) ]; then\n  # If not, prompt user to set a new password\n  read -s -p "Set a password for access: " new_password\n  echo "$new_password" > ~/.password\n  echo "Password set. Please run the script again to access."\n  exit\nfi\n\n# Trap Ctrl+C to prevent interruption\ntrap "echo ; exit" INT\n\n# Infinite loop for password prompt\nwhile true; do\n  read -s -p "Enter password for access: " password\n  if [[ $password == $(cat ~/.password) ]]; then\n    echo "Access granted"\n    break\n  else\n    echo "Access denied"\n  fi\ndone\n\n# Clear the screen and display system info\nclear\nneofetch\n' >> ~/.bashrc
else
clear
fi
