FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update \
&&	apk add openrc \
&&	apk add openssl \
&&	apk add vim \
&& apk add nginx

RUN adduser -D -g 'www' www

RUN mkdir /www \
&& 	mkdir -p /run/nginx \
&&	chown -R www:www /var/lib/nginx \
&&	chown -R www:www /www

RUN rm /etc/nginx/nginx.conf
COPY srcs/nginx.conf	/etc/nginx/

RUN mkdir /etc/nginx/ssl \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/www.pem -keyout /etc/nginx/ssl/www.key -subj "/C=BE/ST=Bxl/L=Bruxelles/O=s19/OU=aglorios/CN=ft_services"

COPY srcs/index.html /www

EXPOSE 80 443

RUN nginx -t

CMD nginx -g "daemon off;" 
#CMD sleep infinity & wait
