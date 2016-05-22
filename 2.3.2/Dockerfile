FROM docketbook/rethinkdb-alpine:2.3.2
MAINTAINER Tom Midson <tm@docketbook.io>

ENV CONTAINERBUDDY_VERSION 1.2.1

COPY rethinkdb-consul.json /etc/rethinkdb-consul.json
COPY rethinkdb_health.sh /usr/local/bin/rethinkdb_health.sh

USER root

RUN set -x \
  && wget -O containerpilot.tar.gz https://github.com/joyent/containerpilot/releases/download/2.1.2/containerpilot-2.1.2.tar.gz \
  && tar -xzf containerpilot.tar.gz -C /usr/local/bin \
  && rm -r containerpilot.tar.gz \
  && chmod +x /usr/local/bin/rethinkdb_health.sh

ENV CONTAINERPILOT=file:///etc/rethinkdb-consul.json

EXPOSE 29015 28015 8080

ENTRYPOINT [ "/usr/local/bin/containerpilot", "rethinkdb", "--bind","all"]
