# GitHub Backup

[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Small script to automatically backup all your GitHub repos at once thanks to [GitHub APIs](https://developer.github.com/v3/repos/) and pipes.

```bash
USERNAME='your_username'
PASSWORD='your_password'

curl -u $USERNAME:$PASSWORD https://api.github.com/user/repos |
grep 'full_name' | grep $USERNAME | sed 's/.*"full_name": "//' | sed 's/",//' |
while IFS= read -r LINE; do git clone https://github.com/$LINE; done
```

### Coming soon

- Better implementation (one big regex if possible)
- Incremental updates
