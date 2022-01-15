#Installing Lamp by NetThroughTec
force_color_prompt=yes
apt update 
apt upgrade
apt install apache2
apt install mariadb-server
echo -e "\e[31m \e[1m Choose a Safe Sql Password   \e[39m  \e[0m"
mysql_secure_installation 
apt install php libapache2-mod-php php-gd php-mysql
echo Linux Apache MySQL PHP installation Finished
