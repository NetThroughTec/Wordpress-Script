#Wordpress Install by NetThroughTec
#Installing Lamp 

force_color_prompt=yes
apt update 
apt upgrade
apt install apache2
apt install mariadb-server
echo -e "\e[31m \e[1m Choose a Safe Sql Password   \e[39m  \e[0m"
mysql_secure_installation 
apt install php libapache2-mod-php php-gd php-mysql
echo Linux Apache MySQL PHP installation Finished
#Wordpress Part
read -p "Database Passwort: " -s dbpw
echo -e "\e[31m Previously chosen Passwort \e[39m"
mysql -e "CREATE DATABASE wpbase;"
mysql -e "SHOW DATABASES;"
mysql -e "GRANT ALL ON wpbase.* TO 'wpuser'@'localhost' IDENTIFIED BY '$dbpw';"
mysql -e "FLUSH PRIVILEGES;"

#PHP Part
apt update
apt install php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip
systemctl restart apache2

#wp Part
apt install curl
curl -O https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
rm latest.tar.gz
mv wordpress /var/www/wordpress
sed -i -e 's/index.html//g' /etc/apache2/sites-available/000-default.conf
sed -i -e 's/html/wordpress/g' /etc/apache2/sites-available/000-default.conf
chown -R www-data:www-data /var/www/wordpress/
chmod 755 -R /var/www/wordpress/
systemctl restart apache2
echo Please switch to Web database Name wpbase User wpuser 
