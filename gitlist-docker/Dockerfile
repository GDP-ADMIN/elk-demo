FROM debian:wheezy

MAINTAINER Roy Inganta Ginting <roy.i.ginting@gdplabs.id>

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 && \
    echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list && \
    echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nginx curl php5-fpm git supervisor
ADD nginx.conf /etc/nginx/nginx.conf
ADD app /etc/nginx/sites-available/

RUN mkdir -p /etc/nginx/sites-enabled && \
    rm /etc/nginx/conf.d/default.conf && \
    ln -sf /etc/nginx/sites-available/app /etc/nginx/sites-enabled/

ADD gitlist.tar.gz /var/www/

VOLUME [ "/var/log/nginx" ]

RUN mkdir /git-repositories && \
    cd /git-repositories && \
    git clone https://github.com/klaussilveira/gitlist

ADD nginx-fpm.conf /etc/supervisor/conf.d/

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
