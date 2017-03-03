FROM alpine:latest
MAINTAINER tangfeixiong <tangfx128@gmail.com>

#RUN apk add --update netcat-openbsd && rm -rf /var/cache/apk/*
COPY gofileserver /
WORKDIR /mnt
VOLUME ["/mnt"]
CMD ["/gofileserver"]
EXPOSE 48080
