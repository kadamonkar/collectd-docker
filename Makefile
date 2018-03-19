DOCKER_REPOSITORY := $(shell cat REGISTRY)
DOCKER_IMAGE_NAME := $(shell cat IMAGE_NAME)
DOCKER_IMAGE_TAG := $(shell cat IMAGE_TAG)

.PHONY: all build tag push 

all: build tag push clean_build

build:
	docker build -t $(DOCKER_IMAGE_NAME) --rm .

tag:
	docker tag $(DOCKER_IMAGE_NAME) $(DOCKER_REPOSITORY)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
	docker tag $(DOCKER_IMAGE_NAME) $(DOCKER_REPOSITORY)/$(DOCKER_IMAGE_NAME)
        
push:
	docker push $(DOCKER_REPOSITORY)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)
	docker push $(DOCKER_REPOSITORY)/$(DOCKER_IMAGE_NAME)

clean_latest:
	docker rmi -f $(DOCKER_IMAGE_NAME)

clean_build:
	docker rmi -f $(DOCKER_REPOSITORY)/$(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG)


clean_all:
	docker images | grep "$(DOCKER_IMAGE_NAME)" | awk '{print $$3}' | xargs docker rmi -f || true
