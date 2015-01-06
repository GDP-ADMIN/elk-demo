FROM debian:wheezy

MAINTAINER Roy Inganta Ginting <roy.i.ginting@gdplabs.id>

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.6.2-1~wheezy
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nginx=${NGINX_VERSION} curl
ADD nginx.conf /etc/nginx/nginx.conf
ADD kibana /etc/nginx/sites-available/
RUN mkdir -p /etc/nginx/sites-enabled
RUN rm /etc/nginx/conf.d/default.conf
RUN ln -sf /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/

ADD users.pwd /etc/nginx/keys/

ADD kibana-3.1.2.tar.gz /var/www/
RUN ln -sf /var/www/kibana-3.1.2 /var/www/html

VOLUME [ "/var/log/nginx" ]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

