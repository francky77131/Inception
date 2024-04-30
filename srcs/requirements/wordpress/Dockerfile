FROM	debian:bullseye

RUN	apt update -y && \
	apt upgrade -y
	
RUN	apt-get install -y php7.4 \
	wget \
	php-phar \
	php-fpm \
	php-mysql \
	mariadb-client \
	vim \
	mariadb-server \
	php-common \
	php-cgi \
	php-curl \
	php-cli \
	php-xml

RUN	mkdir -p /var/www/wordpress

COPY	./conf/www.conf	/etc/php/7.4/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar

RUN	cp wp-cli.phar /usr/local/bin/wp

COPY	./conf/conf.sh /conf.sh
RUN chmod +x conf.sh
ENTRYPOINT ["bash", "conf.sh"]