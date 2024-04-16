FROM 	debian:bullseye

RUN	apt update -y && \
	apt upgrade -y && \
	apt install nginx -y && \
	apt install vim -y && \
	mkdir -p /etc/nginx/ssl && \
	apt install openssl -y
RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key -subj "/CN=frgojard.42.fr"

RUN	chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY	tools/default /etc/nginx/sites-available/default

COPY	conf/nginx.conf /etc/nginx/ngin.conf


CMD	[ "nginx", "-g", "daemon off;" ]