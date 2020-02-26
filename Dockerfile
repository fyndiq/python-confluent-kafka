FROM python:3.8-slim-buster
RUN apt update && apt install -y make && \
    useradd -d /app --create-home app && \
    rm -rf /var/lib/apt/lists/*
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
WORKDIR /app
ENV PYTHONUNBUFFERED 1
CMD ["python"]
