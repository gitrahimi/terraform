#!/bin/bash
sudo su
yum install httpd -y 
systemctl start httpd
systemctl enable httpd
chkconfig httpd on
/etc/init.d/httpd start


yum install epel-release -y
yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm 
yum-config-manager --enable remi-php74 
yum install php -y 
yum --enablerepo=remi-php72 install php |php74
yum install php-mysql -y 

sudo sed -i 's/SELINUX=enforced/SELINUX=disabled/' /etc/sysconfig/selinux
setenforce 0

yum install wget -y 
wget https://wordpress.org/latest.tar.gz
tar -xf latest.tar.gz -C /var/www/html/ 
mv /var/www/html/wordpress/* /var/www/html/ 
systemctl restart httpd
chown -R apache:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
systemctl restart httpd


## Installing MariaDB
yum install mariadb-server mariadb -y
systemctl start mariadb
systemctl enable mariadb
mysql_secure_installation
mysql
systemctl restart mariadb
getenforce
vi /etc/sysconfig/selinux
setenforce 0
getenforce
systemctl restart mariadb
systemctl status mariadb