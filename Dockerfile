FROM docketbook/rethinkdb-alpine:2.3.0
MAINTAINER Tom Midson <tm@docketbook.io>

ENV CONTAINERBUDDY_VERSION 1.2.1

COPY rethinkdb-consul.json /etc/rethinkdb-consul.json
COPY rethinkdb_health.sh /usr/local/bin/rethinkdb_health.sh

USER root

RUN set -x \
        && apk add rethinkdb --update-cache \
           --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
           --allow-untrusted \
	&& apk add --no-cache --virtual .build-deps \
		openssl \
	&& wget -O containerbuddy.tar.gz https://github.com/joyent/containerbuddy/releases/download/"$CONTAINERBUDDY_VERSION"/containerbuddy-"$CONTAINERBUDDY_VERSION".tar.gz \
	&& tar -xzf containerbuddy.tar.gz -C /usr/local/bin \
	&& rm -r containerbuddy.tar.gz \
	&& apk del .build-deps \
	&& chmod +x /usr/local/bin/rethinkdb_health.sh

ENV CONTAINERBUDDY=file:///etc/rethinkdb-consul.json

EXPOSE 28015 8080

ENTRYPOINT [ "/usr/local/bin/containerbuddy", "rethinkdb", "--bind","all"]