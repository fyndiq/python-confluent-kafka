REPO=fyndiq
NAME=python-alpine-kafka
TAG=python3.6.4-librdkafka0.11.4
IMG=$(REPO)/$(NAME):$(TAG)

build:
	docker build -t $(IMG) .

run:
	docker run -it --rm $(IMG)

push: build
	docker push $(IMG)
