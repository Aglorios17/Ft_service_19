FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk update \
&&	apk upgrade \
&&	apk add openrc \
&&  apk add mariadb mariadb-client \
&& 	rm -rf /var/cache/apk/*

COPY srcs/wordpress.sql	www/
COPY srcs/sql_init.sh ./

#RUN /usr/bin/mysql_install_db --user=mysql --datadir="/var/lib/mysql"
#RUN /usr/bin/mysqld_safe --datadir="/var/lib/mysql"

RUN	chmod 777 sql_init.sh

EXPOSE 3306

RUN	./sql_init.sh
