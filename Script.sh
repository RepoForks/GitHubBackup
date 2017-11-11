#!/bin/bash

USERNAME='your_github_username'
PASSWORD='your_github_password'
DIRECTORY='github_backup_directory'

cd "$DIRECTORY"

curl -u $USERNAME:$PASSWORD https://api.github.com/user/repos |
grep 'full_name' | grep $USERNAME | sed 's/.*"full_name": "//' |
sed 's/",//' | sed -e "s/$USERNAME\///g" | while IFS= read -r REPO; do
  if [ -d ./$REPO ]
  then
    echo "$REPO: PULLING UPDATES" && cd $REPO && git pull origin && cd ..
  else
    echo "$REPO: CLONING" && git clone https://github.com/$USERNAME/$REPO
  fi
done
