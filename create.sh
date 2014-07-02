#!/bin/bash
 
clear
 
echo "Domain name to set up: "
read domainname
 
cd /etc/apache2/sites-available
 
clear
 
sed s/DOMAIN/$domainname/g template > $domainname

cd /etc/apache2/sites-enabled

mkdir /var/www/$domainname
touch /var/www/$domainname/index.html
 
chown -R www-data.www-data /var/www/$domainname
 
a2ensite $domainname
 
service apache2 restart