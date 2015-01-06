#!/bin/bash

if [[ "$1" == "--elasticsearch"* ]]; then
    ES=$(echo "$1" | cut -d = -f 2)
    sed -i 's|host => .*|host => "'$ES'"|' /logstash/logstash.conf
    /logstash/bin/logstash -f /logstash/logstash.conf
else
    exec "$@"
fi
