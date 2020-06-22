FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk update \
&&	apk upgrade \
&&	apk	add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://wordpress.org/latest.tar.gz \
&& tar -xvf latest.tar.gz \
&& rm latest.tar.gz

Run mkdir /www
RUN mv  wordpress/* /www/
#COPY srcs/wp-config.php /www/
RUN mkdir -p /run/wordpress

EXPOSE 5050

CMD php -S 0.0.0.0:5050 -t /www/
