FROM python:3.6.2-alpine3.6

RUN \
    echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache \
        ca-certificates \
        g++ \
        git \
        librdkafka@edge \
        librdkafka-dev@edge \
        libressl \
        libressl-dev \
        make \
        musl-dev \
        zlib-dev

ENV PYTHONUNBUFFERED 1

CMD ["python"]
