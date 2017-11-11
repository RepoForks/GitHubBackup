# GitHub Backup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Small script to automatically backup and keep up-to-date all your GitHub repos at once thanks to [GitHub APIs](https://developer.github.com/v3/repos/) and pipes.

Now with **incremental updates**: if the repo has been cloned previously a `pull origin` request is sent, otherwise a `clone` request.

```bash
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

```

### Coming soon

- Better implementation (one big regex if possible)
- ~~Incremental updates~~
