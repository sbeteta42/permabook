📚 PermaBook
Installation DevOps de PermaBook pour les TPs RGPD.

🚀 Pré-requis
OS : Debian 11 ou Ubuntu 20.04 Server
Packages : openssh-server, curl, git, python3-lxml

'''bash
apt update -y && apt install openssh-server git curl python3-lxml -y
🔧 Installation
'''

Connexion à la VM

bash
Copier
Modifier
ssh user@<permabook_IP>
Passage en root

bash
Copier
Modifier
su -
Installation de PermaBook

bash
Copier
Modifier
curl https://raw.githubusercontent.com/sbeteta42/permabook/main/install.sh | sh -
🧪 Fuzzing
Pour tester (fuzzer) les identifiants de pages du PermaBook :

bash
Copier
Modifier
apt install python3
python3 wp-fuzz.py http://localhost/certa/permabook page_id 100
🌐 Accéder à PermaBook depuis l’extérieur
Par défaut, PermaBook n’est accessible que depuis localhost dans la VM.
Pour y accéder depuis votre machine :

bash
Copier
Modifier
sudo ssh -L 80:127.0.0.1:80 user@<permabook_IP>
Ensuite, ouvrez dans votre navigateur :

arduino
Copier
Modifier
http://localhost/certa/permabook
📄 Documentation
Une documentation plus complète est disponible ici :
📄 TP_install_permabook.pdf
