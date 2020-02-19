FROM python:3.8-slim-buster
RUN apt-get update && apt-get install -y sudo && \
    echo "app ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/app && \
    useradd -d /app --create-home app && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
WORKDIR /app
USER app
ENV PYTHONUNBUFFERED 1
CMD ["python"]
