FROM 	debian:bullseye

RUN	apt update -y && \
	apt upgrade -y

RUN	apt install -y nginx \
	vim \
	curl 

RUN	mkdir -p /etc/nginx/ssl && \
	apt install openssl -y

RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key -subj "/CN=frgojard.42.fr"
RUN mkdir -p /var/www/wordpress

RUN	chmod 755 /var/www/wordpress && \
	chown -R www-data:www-data /var/www/wordpress

RUN mkdir -p /var/run/nginx

COPY	tools/default /etc/nginx/sites-available/default

COPY	conf/nginx.conf /etc/nginx/nginx.conf



ENTRYPOINT [ "nginx", "-g", "daemon off;" ] 
#cela permet de lancer nginx en avant plans et nom en arriere plans.