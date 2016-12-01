FROM alpine:latest
RUN apk add --update netcat-openbsd && rm -rf /var/cache/apk/*
COPY entrypoint.sh /
COPY index.html /
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
