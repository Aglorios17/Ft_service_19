FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN	apk update \
&&	apk upgrade \
&&	apk add openrc \
&&	apk add openssl \
&& apk add vsftpd

RUN rm -rf /etc/vsftpd/vsftpd.conf
COPY srcs/vsftpd.conf /etc/vsftpd/

RUN mkdir /srv/ftp
RUN chown nobody:nogroup /srv/ftp
RUN echo "anon" | tee /srv/ftp/anon.txt

#RUN rc-service vsftpd restart
#RUN rc-update add vsftpd

EXPOSE 21

#CMD vsr -S 0.0.0.0:5000 -t /www/
