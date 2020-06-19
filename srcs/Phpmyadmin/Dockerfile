FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk update \
&&	apk upgrade \
&&	apk	add	php7 php7-fpm php7-mysqli php-common php7-cli php7-common php7-json php7-opcache \
&& apk	add php-json php-mbstring

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages Phpmyadmin

RUN mv Phpmyadmin /www/
RUN mkdir -p /run/phpMyadmin

EXPOSE 5000

#RUN php -S 0.0.0.0:5000 -t /www/
