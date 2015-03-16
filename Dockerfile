FROM ubuntu:14.10
MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y upgrade

RUN apt-get -y install nginx

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

VOLUME ["/etc/nginx/conf.d", "/etc/nginx/sites-enabled", "/var/log/nginx"]

EXPOSE 80 443

CMD nginx
