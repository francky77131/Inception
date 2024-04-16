FROM	debian:bullseye

RUN	apt update -y && \
	apt upgrade -y && \
	apt-get install wget -y

RUN	apt-get install -y php7.4 \
	php-phar \
	php-fpm \
	php-mysql \
	mariadb-client \
	vim

RUN	mkdir -p /var/www/html

COPY	conf/www.conf	/etc/php/7.4/fpm/pool.d/www.conf

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN	chmod +x wp-cli.phar

RUN	mv wp-cli.phar /usr/local/bin/wp

COPY	conf/conf.sh /conf.sh
RUN chmod +x conf.sh
CMD	["bash", "conf.sh"]