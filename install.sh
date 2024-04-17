# Mise à jour de l'Os.. Please wait...
echo "Mise à jour de l'Os.. Please wait..."
apt update && apt full-upgrade -y
clear

# Installation des dpendances fonctionnelles
echo " Installation des dpendances fonctionnelles..."
apt install apache2 mariadb-server mariadb-client php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml php-gd php-intl php-mbstring php-imagick -y
clear

# On stoppe le service Apache2
echo "On stoppe le service Apache2" 
service apache2 stop

# Download de PERMABOOK
echo "Download de PERMABOOK..."
wget http://download1.beteta.org:9658/share/FGc-TwVA-k9P6P8E/sitePermabook.zip -O /tmp/sitePermabook.zip
clear

#INSTALLATION DE PERMABOOK
echo "Installation de PERMABOOK... 
mkdir -p /var/www/html/certa/permabook
unzip -d /tmp/ /tmp/sitePermabook.zip
unzip -d /var/www/html/certa/permabook/ /tmp/sitePermabook/permabook.zip
chown -R www-data:www-data /var/www/html/certa/permabook
service apache2 start
mysql -u root -e "create database permabook;"
mysql -u root -e "grant all privileges on permabook.* to 'permauser'@'localhost' identified by 'permapass';"
mysql -u root -e "flush privileges;"
mysql -u root permabook < /tmp/sitePermabook/permabook.sql
echo " Installation de PERMABOOK terminé "
