#!/bin/bash

USERNAME='your_username'
PASSWORD='your_password'

cd ~/Desktop && mkdir GitHub_Backup && cd GitHub_Backup
curl -u $USERNAME:$PASSWORD https://api.github.com/user/repos | grep 'full_name' | grep $USERNAME | sed 's/.*"full_name": "//' | sed 's/",//' |
while IFS= read -r LINE; do git clone https://github.com/$LINE; done
