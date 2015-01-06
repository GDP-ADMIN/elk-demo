FROM debian:wheezy

RUN apt-get update && \
    apt-get install -y openjdk-7-jre-headless wget

ENV ES_PKG_NAME elasticsearch-1.4.0
ENV ES_HOME /data

RUN useradd -d $ES_HOME -m -s /bin/bash elasticsearch
RUN \
    cd / && \
    wget --no-check-certificate https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
    tar xvzf $ES_PKG_NAME.tar.gz && \
    rm -f $ES_PKG_NAME.tar.gz && \
    mv /$ES_PKG_NAME /elasticsearch
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME /data

EXPOSE 9200
EXPOSE 9300

USER elasticsearch

CMD ["/elasticsearch/bin/elasticsearch"]

