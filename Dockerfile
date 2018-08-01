FROM python:3.7.0-alpine3.8

ARG VERSION=0.11.5

RUN apk add --no-cache \
        bash \
        ca-certificates \
        g++ \
        git \
        libressl \
        libressl-dev \
        linux-headers \
        make \
        musl-dev \
        zlib-dev

# https://github.com/alpinelinux/aports/pull/4841
COPY libressl.patch /tmp/libressl.patch

RUN wget https://github.com/edenhill/librdkafka/archive/v$VERSION.tar.gz \
        -O /tmp/librdkafka-$VERSION.tar.gz && \
    cd /tmp/ && \
    tar zxf librdkafka-$VERSION.tar.gz && \
    cd librdkafka-$VERSION && \
    patch -p1 < /tmp/libressl.patch && \
    ./configure && \
    make && \
    make install

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

CMD ["python"]
