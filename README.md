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

# Access permabook

Permabook is only accessible correcly from localhost(inside of the VM).
To access it from outside:

```bash
sudo ssh -L 80:127.0.0.1:80 user@<permabook IP>
```

Now you can go on `http://localhost/certa/permabook` on your laptop instead of inside your VM.
