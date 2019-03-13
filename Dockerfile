FROM buildpack-deps:18.04-curl
MAINTAINER Swire Chen <idoop@msn.cn>

ENV PUB_CACHE=/var/dart_cache \
    PUB_PORT=80 \
    PUB_HOST=0.0.0.0 \
    PUB_STANDALONE=true \
    PUB_DATA_PATH=/opt/pub_data \
    PUB_SERVER_PATH=/var/pub_server/example/example.dart \
    DART_PATH=/var/dart-sdk/bin

ENV PATH ${PATH}:${DART_PATH}

COPY docker-entrypoint /usr/local/bin

RUN apt update && apt install -y unzip && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/local/bin/docker-entrypoint \
    && wget -q https://storage.googleapis.com/dart-archive/channels/stable/release/2.2.0/sdk/dartsdk-linux-x64-release.zip \
    && unzip dartsdk-linux-x64-release.zip \
    && mkdir -p ${PUB_CACHE} ${PUB_DATA_PATH} &&  mv dart-sdk /var \
    && wget -q https://github.com/dart-lang/pub_server/archive/master.zip \
    && unzip master.zip -d /var \
    && mv /var/pub_server-master /var/pub_server \
    && cd /var/pub_server \
    && pub get

WORKDIR /var/pub_server/

ENTRYPOINT ["docker-entrypoint"]
