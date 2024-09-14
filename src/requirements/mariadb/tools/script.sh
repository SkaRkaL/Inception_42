#!/bin/bash
sed -i "s|# port = 3306|port = 3306|1" /etc/mysql/mariadb.cnf

service mariadb start
	mysqladmin -u root password "${MYSQLROOTPASSWORD}"
	mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQLDB}\`;"
	mariadb -e "CREATE USER IF NOT EXISTS \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}';"
	mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQLDB}.* TO \`${MSQLUSER}\`@'%' IDENTIFIED BY '${MYSQLPASSWORD}' ;"
	mariadb -e "FLUSH PRIVILEGES;"
service mariadb stop


exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql' 