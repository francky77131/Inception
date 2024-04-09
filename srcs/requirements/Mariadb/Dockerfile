FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tool/db.sh /db.sh

RUN	chmod +x /db.sh

CMD	[ "bash", "db.sh"]