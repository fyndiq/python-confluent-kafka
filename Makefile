REPO=fyndiq
NAME=python-alpine-kafka
TAG=latest

build:
	docker build -t $(REPO)/$(NAME):$(TAG) .

run:
	docker run -it --rm $(NAME)

push:
	docker push $(REPO)/$(NAME):$(TAG)
