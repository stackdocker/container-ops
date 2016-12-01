FROM alpine:3.3
MAINTAINER jp@roemer.im

# Install system utils & Gogs runtime dependencies
#ADD https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 /usr/sbin/gosu
COPY gosu /usr/sbin/gosu
#RUN chmod +x /usr/sbin/gosu \
# && apk --no-cache --no-progress add ca-certificates bash git linux-pam s6 curl openssh socat
RUN chmod +x /usr/sbin/gosu \
 && apk --update-cache --progress add ca-certificates bash git linux-pam s6 curl openssh socat

#ENV GOGS_CUSTOM /data/gogs
ENV GOPATH=/go GOBIN=/go/bin PATH=$PATH:/go/bin

#COPY . /app/gogs/
#WORKDIR /app/gogs/
WORKDIR /go
#RUN ./docker/build.sh
COPY install-go-gcc.sh ./ 
RUN ./install-go-gcc.sh

# Configure LibC Name Service
COPY docker/nsswitch.conf /etc/nsswitch.conf

# Configure Docker Container
#VOLUME ["/data"]
#EXPOSE 22 3000
#ENTRYPOINT ["docker/start.sh"]
#CMD ["/bin/s6-svscan", "/app/gogs/docker/s6/"]
CMD ["/bin/ash"]
