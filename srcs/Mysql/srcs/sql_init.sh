#! /bin/bash

# Wait that mysql was up
# Init DB
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
mysql -u root -e "CREATE USER 'aglorios'@'localhost' IDENTIFIED BY 'mdp123';"
mysql -u root -e "CREATE USER 'invite'@'localhost' IDENTIFIED BY 'invite';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"
