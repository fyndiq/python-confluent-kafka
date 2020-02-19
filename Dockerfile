FROM debian:buster-slim AS builder
WORKDIR /tmp
ARG LIBRDKAFKA_VERSION=1.3.0
RUN apt-get update && apt-get install -y curl build-essential && \
    curl -Lo librdkafka-$LIBRDKAFKA_VERSION.tar.gz https://github.com/edenhill/librdkafka/archive/v$LIBRDKAFKA_VERSION.tar.gz && \
    tar zxf librdkafka-$LIBRDKAFKA_VERSION.tar.gz && \
    cd librdkafka-$LIBRDKAFKA_VERSION && \
    ./configure --install-deps && \
    make && \
    make install

FROM python:3.8-slim-buster
COPY --from=builder /usr/local/lib/librdkafka* /usr/local/lib/
COPY --from=builder /usr/local/include/librdkafka/ /usr/local/include/librdkafka/
RUN apt-get update && apt-get install -y sudo libsasl2-2 && ldconfig && \
    echo "app ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/app && \
    useradd -d /app --create-home app && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
WORKDIR /app
USER app
ENV PYTHONUNBUFFERED 1
CMD ["python"]
