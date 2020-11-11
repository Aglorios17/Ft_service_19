FROM alpine:latest

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update \
&&	apk add curl

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz \
&&	tar xvf telegraf.tar.gz \
&&	 mv 'telegraf-1.16.0' /telegraf 

COPY ./srcs/setup.sh .
COPY ./srcs/telegraf.conf etc/telegraf/telegraf.conf

RUN chmod 777 setup.sh
EXPOSE 8025

CMD ./setup.sh
