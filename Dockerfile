FROM python:3.7.3-alpine3.9

ARG VERSION=1.0.1

COPY requirements.txt /tmp/

RUN apk add --no-cache \
        bash \
        ca-certificates \
        libressl && \
    apk add --no-cache --virtual .build-deps  \
        g++ \
        git \
        libressl-dev \
        linux-headers \
        make \
        musl-dev \
        zlib-dev && \
    wget https://github.com/edenhill/librdkafka/archive/v$VERSION.tar.gz \
        -O /tmp/librdkafka-$VERSION.tar.gz && \
    cd /tmp/ && \
    tar zxf librdkafka-$VERSION.tar.gz && \
    cd librdkafka-$VERSION && \
    ./configure && \
    make && \
    make install && \
    cd .. && rm -fr librdkafka-$VERSION && \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    apk del .build-deps

ENV PYTHONUNBUFFERED 1
CMD ["python"]
