apt update && apt full-upgrade -y
apt install apache2 mariadb-server mariadb-client php libapache2-mod-php php-cli php-mysql php-zip php-curl php-xml php-gd php-intl php-mbstring php-imagick -y
service apache2 stop
wget https://github.com/hivecloud-iris/permabook/raw/main/sitePermabook.zip -O /tmp/sitePermabook.zip
mkdir -p /var/www/html/certa/permabook
unzip -d /tmp/ /tmp/sitePermabook.zip
unzip -d /var/www/html/certa/permabook/ /tmp/sitePermabook/permabook.zip
chown -R www-data:www-data /var/www/html/certa/permabook
service apache2 start
mysql -u root -e "create database permabook;"
mysql -u root -e "grant all privileges on permabook.* to 'permauser'@'localhost" identified by 'permapass';"
mysql -u root -e "flush privileges;"
mysql -u root permabook < /tmp/sitePermabook/permabook.sql
