FROM alpine:latest

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update \
&&	apk add influxdb \
&&	apk add curl

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

COPY ./srcs/setup.sh .
COPY ./srcs/telegraf.conf etc/telegraf/telegraf.conf

RUN chmod 777 setup.sh
EXPOSE 8086

CMD ./setup.sh
