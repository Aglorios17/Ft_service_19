FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update && apk add --no-cache --upgrade bash

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/grafana.tar.gz /
RUN tar -zxvf grafana.tar.gz

RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 3000

CMD ./setup.sh
