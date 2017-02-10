# maintainer tangfeixiong <tangfx128@gmail.com>
IMG_NAME=docker.io/tangfeixiong/ubuntu-packages-repo
IMG_TAG=git$(shell git rev-parse --short HEAD)
 
.PHONY: all dockerimage

all: dockerimage

dockerimage:
    @docker build -t $(IMG_NAME):$(IMG_TAG) .