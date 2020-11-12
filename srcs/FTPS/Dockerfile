FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update && \
    apk upgrade && \
    apk add openssl curl

RUN  apk add --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ pure-ftpd
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN adduser -D -h /home/aglorios aglorios && \
    echo -e 'Aglorios\nAglorios' | passwd aglorios && \
    echo -e 'Aglorios\nAglorios' | pure-pw useradd aglorios -u aglorios -g aglorios -d /home/aglorios

RUN openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=BX/L=Belgique/O=19/CN=aglorios" \
    -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem

COPY ./srcs/setup.sh /setup.sh
COPY ./srcs/telegraf.conf etc/telegraf/telegraf.conf
RUN chmod +x setup.sh

EXPOSE 21 21000 21001 21002 21003 21004

CMD ./setup.sh
