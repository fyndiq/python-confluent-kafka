FROM python:3.8-slim-buster
RUN useradd -d /app --create-home app
COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt
WORKDIR /app
ENV PYTHONUNBUFFERED 1
CMD ["python"]
