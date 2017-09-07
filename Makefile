TAGNAME=python-alpine-kafka

build:
	docker build -t $(TAGNAME) .

run:
	docker run -it --rm $(TAGNAME)
