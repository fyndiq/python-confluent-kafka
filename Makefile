REPO=fyndiq
NAME=python-alpine-kafka
TAG=python3.6.4-librdkafka0.11.1-r1

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run:
	docker run -it --rm $(NAME)

push: build
	docker push $(REPO)/$(NAME):$(TAG)
