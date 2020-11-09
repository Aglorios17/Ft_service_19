FROM alpine

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

RUN apk update && apk add --no-cache --upgrade bash

COPY ./srcs/grafana.tar.gz /
RUN tar -zxvf grafana.tar.gz

RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

#COPY ./srcs/grafana.db ./grafana-6.7.2/data/
COPY ./srcs/setup.sh /setup.sh

RUN chmod +x /setup.sh

EXPOSE 3000

CMD ./setup.sh
