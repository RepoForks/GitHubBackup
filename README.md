# GitHub Backup

Small script to automatically backup all your GitHub repos in once thanks to [GitHub APIs](https://developer.github.com/v3/repos/).

```bash
curl -u $USERNAME:$PASSWORD https://api.github.com/user/repos |
grep 'full_name' | grep $USERNAME | sed 's/.*"full_name": "//' | sed 's/",//' |
while IFS= read -r LINE; do git clone https://github.com/$LINE; done
```
