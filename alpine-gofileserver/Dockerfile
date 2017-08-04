FROM scratch
# FROM alpine:3.4
# FROM docker.io/gliderlabs/alpine
### MAINTAINER tangfeixiong <tangfx128@gmail.com>
LABEL maintainer="tangfeixiong" mailto="tangfx128@gmail.com"

# RUN apk add ospd-netstat --update --repository http://dl-6.alpinelinux.org/alpine/edge/community && rm -rf /var/cache/apk/*
COPY gofileserver /
WORKDIR /mnt
VOLUME ["/mnt"]
CMD ["/gofileserver"]
EXPOSE 48080
