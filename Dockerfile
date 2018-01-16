FROM python:3.6.4-alpine3.7

RUN \
    apk add --no-cache \
        bash \
        ca-certificates \
        g++ \
        git \
        librdkafka \
        librdkafka-dev \
        libressl \
        libressl-dev \
        linux-headers \
        make \
        musl-dev \
        zlib-dev

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

CMD ["python"]
