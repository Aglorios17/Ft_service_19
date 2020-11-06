FROM alpine:latest

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update \
&&	apk add openrc \
&& apk add mariadb mariadb-client openrc \
&& rm -rf /var/cache/apk/*

COPY ./srcs/init.sh .
COPY ./srcs/wordpress.sql /
#COPY ./srcs/my.cnf /etc/

#VOLUME /var/lib/mysql

RUN chmod 777 init.sh
EXPOSE 3306

CMD ./init.sh
