FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk update \
&&	apk upgrade \
&&	apk	add	php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session\
&& apk	add php-json php-mbstring

RUN apk add nginx
RUN apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages Phpmyadmin

Run mkdir /www
RUN mv Phpmyadmin/* /www/
RUN mkdir -p /run/phpMyadmin
COPY ./srcs/config.inc.php /www/config.inc.php
COPY ./srcs/setup.sh /
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY ./srcs/nginx.conf /etc/nginx/

RUN chmod 777 setup.sh
EXPOSE 5000

CMD ./setup.sh
