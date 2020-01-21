FROM python:3.7.3-alpine3.9

RUN apk add --no-cache \
        bash \
        ca-certificates \
        git \
        make

RUN apk add --no-cache --virtual .build-deps \
        g++ \
        libressl \
        libressl-dev \
        linux-headers \
        musl-dev \
        zlib-dev

ARG LIBRDKAFKA_VERSION=1.0.1
RUN wget https://github.com/edenhill/librdkafka/archive/v$LIBRDKAFKA_VERSION.tar.gz \
        -O /tmp/librdkafka-$LIBRDKAFKA_VERSION.tar.gz && \
    cd /tmp/ && \
    tar zxf librdkafka-$LIBRDKAFKA_VERSION.tar.gz && \
    cd librdkafka-$LIBRDKAFKA_VERSION && \
    ./configure && \
    make && \
    make install && \
    cd .. && rm -fr librdkafka-$LIBRDKAFKA_VERSION

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt && \
    apk del .build-deps

ENV PYTHONUNBUFFERED 1
CMD ["python"]
