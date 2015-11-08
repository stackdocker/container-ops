#This content are based on https://github.com/docker-library/buildpack-deps/, under trusty sub-directory; and https://github.com/docker-library/golang/, under 1.5 version

#FROM buildpack-deps:trusty-scm

FROM quay.io/tangfeixiong/ubuntu-14-04-3:scm

#RUN apt-get update && apt-get install -y --no-install-recommends \
#		autoconf \
#		automake \
#		bzip2 \
#		file \
#		g++ \
#		gcc \
#		imagemagick \
#		libbz2-dev \
#		libc6-dev \
#		libcurl4-openssl-dev \
#		libevent-dev \
#		libffi-dev \
#		libgeoip-dev \
#		libglib2.0-dev \
#		libjpeg-dev \
#		liblzma-dev \
#		libmagickcore-dev \
#		libmagickwand-dev \
#		libmysqlclient-dev \
#		libncurses-dev \
#		libpng-dev \
#		libpq-dev \
#		libreadline-dev \
#		libsqlite3-dev \
#		libssl-dev \
#		libtool \
#		libwebp-dev \
#		libxml2-dev \
#		libxslt-dev \
#		libyaml-dev \
#		make \
#		patch \
#		xz-utils \
#		zlib1g-dev \
#	&& rm -rf /var/lib/apt/lists/*

# gcc for cgo
RUN apt-get update && apt-get install -y --no-install-recommends \
		g++ \
		gcc \
		libc6-dev \
		make \
	&& rm -rf /var/lib/apt/lists/*

ENV GOLANG_VERSION 1.5.1
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA1 46eecd290d8803887dec718c691cc243f2175fe0

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& echo "$GOLANG_DOWNLOAD_SHA1  golang.tar.gz" | sha1sum -c - \
	&& tar -C /usr/local -xzf golang.tar.gz \
	&& rm golang.tar.gz

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:/opt/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH

#COPY go-wrapper /usr/local/bin/
RUN if [ ! -d "/opt/bin" ]; then mkdir -p /opt/bin; fi 
#RUN mkdir -p "$HOME/bin" \
#        && echo "export PATH=$HOME/bin:$PATH" >> $HOME/.bashrc 
RUN curl https://raw.githubusercontent.com/docker-library/golang/51d6eacd41fe80d41105142b9ad32f575082970f/1.5/go-wrapper \
                -o "/opt/bin/go-wrapper" \
        && chmod -R 777 "/opt/bin/" 
