FROM alpine:latest

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update \
&&	apk add openrc \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

RUN mysql --version

COPY ./srcs/init_docker.sh .
COPY ./srcs/sql_init.sh .
COPY ./srcs/wordpress.sql .

RUN chmod 777 init_docker.sh
RUN chmod 777 sql_init.sh

CMD ./init_docker.sh
