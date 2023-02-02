apt update && apt full-upgrade -y
apt install apache2 mariadb-server mariadb-client php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml php-gd php-intl php-mbstring php-imagick -y
service apache2 stop
mkdir -p /var/www/html/certa/permabook
unzip -d sitePermabook.zip /tmp
unzip -d /tmp/permabook.zip /var/www/html/certa/permabook
chown -R www-data:www-data /var/www/html/certa/permabook
service apache2 start
mysql -u root -e "create database permabook;"
mysql -u root -e "grant all privileges on permabook.* to 'permauser'@'localhost" identified by 'permapass';"
mysql -u root -e "flush privileges;"
