FROM debian:wheezy

RUN apt-get update && \
    apt-get install -y openjdk-7-jre-headless wget && \
    rm -fr /var/lib/apt/lists/*

ENV LS_PKG_NAME logstash-1.4.2
RUN \
    cd / && \
    wget --no-check-certificate https://download.elasticsearch.org/logstash/logstash/$LS_PKG_NAME.tar.gz && \
    tar xvzf $LS_PKG_NAME.tar.gz && \
    rm -f $LS_PKG_NAME.tar.gz && \
    mv /$LS_PKG_NAME /logstash
ADD logstash.conf /logstash/
ADD logstash.sh /logstash/
ADD nginx-logs /logstash/patterns/

RUN useradd -d /home/logstash -m -s /bin/bash -G www-data logstash && \
    chown logstash -R /logstash && \
    chmod 755 /logstash/logstash.sh

USER logstash
ENTRYPOINT ["/logstash/logstash.sh"]
