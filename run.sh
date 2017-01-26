#!/bin/bash
#setting timezone
echo "set timezone to ${RC_TIMEZONE}"
echo "date.timezone = \"${RC_TIMEZONE}\"" >> /etc/php/7.0/fpm/php.ini

#configure nginx
echo "configure nginx"
sed -i "s/{{SERVER_NAME}}/$SRV_NAME/g" default
cp default /etc/nginx/sites-available/default

#roundcube config
echo "configure roundcube"
sed -i "s/{{DB_USER}}/$DB_USR/g" config.inc.php
sed -i "s/{{DB_PASSWORD}}/$DB_PW/g" config.inc.php
sed -i "s/{{DB_HOST}}/$DB_HOST/g" config.inc.php
sed -i "s/{{IMAP_SRV}}/$IMAP_SRV/g" config.inc.php
sed -i "s/{{SMTP_SRV}}/$SMTP_SRV/g" config.inc.php
sed -i "s/{{SUPP_URL}}/$SUPP_URL/g" config.inc.php
DES_KEY=$(< /dev/urandom tr -dc A-Z-a-z-0-9 | head -c${1:-24};echo;)
sed -i "s/{{DES_KEY}}/$DES_KEY/g" config.inc.php
sed -i "s/{{MAIL_NAME}}/$MAIL_NAME/g" config.inc.php
sed -i "s/{{LANG}}/$LANG/g" config.inc.php
sed -i "s/{{PASSWORD_PLUGIN}}/${PASSWORD_PLUGIN:+password}/g" config.inc.php

cp config.inc.php /var/www/html/config/config.inc.php

#password config
echo "configure password plugin"
sed -i "s/{{DB_USER}}/$VMAIL_DB_USER/g" password/config.inc.php
sed -i "s/{{DB_PASSWORD}}/$VMAIL_DB_PW/g" password/config.inc.php
sed -i "s/{{DB_HOST}}/$VMAIL_DB_HOST/g" password/config.inc.php
cp password/config.inc.php  /var/www/html/plugins/password/config.inc.php

echo "wait for database"
while !(mysqladmin -h $DB_HOST -u root -p$DB_ROOT_PW ping)
do
    sleep 1
done
echo "database on"

#database setup
echo "Database Setup"
echo "create database"
mysql -u root -p$DB_ROOT_PW -h $DB_HOST -se "CREATE DATABASE IF NOT EXISTS roundcube;"
echo "initalize database"
mysql -u root -p$DB_ROOT_PW -h $DB_HOST 'roundcube' < /var/www/html/SQL/mysql.initial.sql

nginx -t
service nginx start
service nginx reload

service php7.0-fpm start
service php7.0-fpm restart

/bin/bash