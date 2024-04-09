#!/bin/bash

if [ -d "/var/lib/mysql/${SQL_DATABASE}" ]
then
	echo "${SQL_DATABASE} already exists"
else
	service mariadb start
	sleep 3

	mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
	mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown
	sleep 3
fi

exec mysqld