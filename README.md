# permabook

# Install
To install permabook on debian 11 or Ubuntu 20.04:

```bash
apt install curl
curl https://raw.githubusercontent.com/hivecloud-iris/permabook/main/install.sh | sudo sh -
```

# Fuzz
To Fuzz the pages id of permabook:

```bash
apt install python3
python3 wp-fuzz.py http://localhost/certa/permabook page_id 100
```
