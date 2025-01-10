# Mise à jour de l'Os.. Please wait...
echo "Mise à jour de l'Os.. Please wait..."
apt update && apt full-upgrade -y
sleep 5
clear

# Installation des dépendances fonctionnelles
echo "Installation des dpendances fonctionnelles..."
sleep 5
apt install apache2 mariadb-server mariadb-client php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml php-gd php-intl php-mbstring php-imagick -y
clear

# On stoppe le service Apache2
echo "On stoppe le service Apache2" 
sleep 5
service apache2 stop

# Download de PERMABOOK
echo "Download de PERMABOOK..."
sleep 5
wget http://download1.beteta.org:24659/share/sl6FJKG7tx_foqiD/sitePermabook.zip -O /tmp/sitePermabook.zip
clear

#INSTALLATION DE PERMABOOK
echo "Installation de PERMABOOK..."
sleep5
mkdir -p /var/www/html/certa/permabook
unzip -d /tmp/ /tmp/sitePermabook.zip
unzip -d /var/www/html/certa/permabook/ /tmp/sitePermabook/permabook.zip
chown -R www-data:www-data /var/www/html/certa/permabook
service apache2 start
mysql -u root -e "create database permabook;"
mysql -u root -e "grant all privileges on permabook.* to 'permauser'@'localhost' identified by 'permapass';"
mysql -u root -e "flush privileges;"
mysql -u root permabook < /tmp/sitePermabook/permabook.sql
echo "Installation de PERMABOOK terminé"
