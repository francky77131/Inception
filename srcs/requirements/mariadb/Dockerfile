FROM 	debian:bullseye

RUN	apt update -y
RUN	apt upgrade -y
RUN	apt install vim -y
RUN	apt-get install mariadb-server -y
RUN mkdir -p /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	tools/db.sh /db.sh

RUN	chmod +x /db.sh

ENTRYPOINT	[ "bash", "db.sh"]