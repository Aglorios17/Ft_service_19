FROM alpine:latest

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update \
&&	apk add openrc \
&& apk add mariadb mariadb-client openrc \
&& rm -rf /var/cache/apk/*

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/init.sh .
COPY ./srcs/wordpress.sql /
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

RUN chmod 777 init.sh
EXPOSE 3306

CMD ./init.sh
