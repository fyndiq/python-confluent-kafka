REPO=fyndiq
NAME=python-confluent-kafka
TAG=1.3.0-python3.8.5-buster-v1
IMAGE=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(REPO)/$(NAME):latest

run:
	docker run -it --rm $(IMAGE) bash

push:
	docker push $(IMAGE)
	docker push $(REPO)/$(NAME):latest

pip-update:
	pip-compile -U requirements.in --output-file requirements.txt
