#!/bin/bash
sleep 5
wp config create	--allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install	--title=$WP_TITLE \
			--admin_user=$WP_ADMIN \
			--admin_password=$WP_ADMIN_PASSWORD \
			--admin_email=$WP_ADMIN_MAIL \
			--url=$WP_URL --allow-root --skip-email
	
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

if [ ! -d "/run/php" ]
then
	mkdir /run/php
fi
	
exec /usr/sbin/php-fpm7.4 -F