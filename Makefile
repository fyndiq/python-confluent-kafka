REPO=fyndiq
NAME=python-alpine-kafka
TAG=python3.6.2-librdkafka0.9.5-r0

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run:
	docker run -it --rm $(NAME)

push: build
	docker push $(REPO)/$(NAME):$(TAG)
