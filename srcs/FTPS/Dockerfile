FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk add --no-cache vsftpd \
&&	apk add openssl \
&&	apk add openrc

RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=aglorios/CN=ft_services" -keyout /etc/ssl/certs/vsftpd.pem -out /etc/ssl/certs/vsftpd.pem

RUN chmod 755 /etc/ssl/certs/vsftpd.pem

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY ./srcs/setup.sh /

COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
RUN	chmod 777 setup.sh

EXPOSE 21
VOLUME ftp/ftp

CMD	./setup.sh
