FROM 	debian:bullseye

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install vim -y
RUN	apt-get install mariadb-server -y

COPY	conf/50-server.conf /etc/mysql/mariadb.conf.d/50-server.conf

COPY	tools/db.sh /db.sh

RUN	chmod +x /db.sh

CMD	[ "bash", "db.sh"]