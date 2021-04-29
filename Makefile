REPO=fyndiq
NAME=python-confluent-kafka
TAG=1.5.0-python3.8.9-buster-v1
IMAGE=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMAGE) .

run:
	docker run -it --rm $(IMAGE) bash

push:
	docker tag $(IMAGE) $(REPO)/$(NAME):latest
	docker push $(IMAGE)
	docker push $(REPO)/$(NAME):latest

archive-image:
	docker save -o image.tar $(IMAGE)

pip-update:
	pip-compile -U requirements.in --output-file requirements.txt
