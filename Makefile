REPO=fyndiq
NAME=python-alpine-kafka
TAG=python3.6.4-librdkafka0.11.3

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run:
	docker run -it --rm $(REPO)/$(NAME):$(TAG)

push: build
	docker push $(REPO)/$(NAME):$(TAG)
