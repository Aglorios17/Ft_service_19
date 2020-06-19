FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk update \
&&	apk upgrade \
&&	apk	add	php7 php7-fpm php7-mysqli php-common php7-cli php7-common php7-json php7-opcache \
&& apk	add php-json php-mbstring

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& rm latest.tar.gz

RUN	 mv  wordpress /www/
COPY srcs/wp-config.php /www/wordpress

EXPOSE 5050

#RUN php -S 0.0.0.0:5050 -t /www/
