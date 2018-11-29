REPO=fyndiq
NAME=python-alpine-kafka
TAG=python3.7.1-librdkafka0.11.6
IMG=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMG) .
	docker tag $(IMG) $(REPO)/$(NAME):latest

run:
	docker run -it --rm $(IMG)

push: build
	docker push $(IMG)
	docker push $(REPO)/$(NAME):latest
