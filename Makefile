REPO=fyndiq
NAME=python-alpine-kafka
TAG=python3.7.6-librdkafka1.0.1-v0
IMAGE=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(REPO)/$(NAME):latest

run:
	docker run -it --rm $(IMAGE)

push:
	docker push $(IMAGE)
	docker push $(REPO)/$(NAME):latest

pip-update:
	pip-compile requirements.in --output-file requirements.txt
