#!/bin/ash
openrc &> /dev/null
touch /run/openrc/softlevel
/etc/init.d/mariadb setup &> /dev/null
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
service mariadb restart &> /dev/null

# Create Database wordpress
mysql --user=root << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin';
GRANT ALL ON wordpress.* TO 'admin'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Add Database
mysql --user=root wordpress < /wordpress.sql

tail -F /dev/null
