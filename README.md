# permabook
- Installation DevOps de permabook pour les TPs RGPD

# Pré-requis
OS: Debian 11 / Ubuntu 20.04 Server
openssh-server et curl

# Installation
Pour installer permabook sur debian 11 ou Ubuntu 20.04 :
- se connecter sur la VM via ssh avec le compte user
- Faire su -

```bash
curl https://raw.githubusercontent.com/sbeteta42/permabook/main/install.sh | sh -
```

# Fuzzing
Pour fuzzer l'identifiant des pages du permabook :

```bash
apt install python3
python3 wp-fuzz.py http://localhost/certa/permabook page_id 100
```

# Accéder à permabook

Permabook n'est accessible correctement que depuis localhost (à l'intérieur de la VM).
Pour y accéder depuis l'extérieur :

```bash
sudo ssh -L 80:127.0.0.1:80 user@<permabook IP>
```

Maintenant, vous pouvez aller sur `http://localhost/certa/permabook` sur votre ordinateur portable au lieu de l'intérieur de votre VM.
