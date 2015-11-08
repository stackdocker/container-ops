#This content are based on https://github.com/docker-library/buildpack-deps, under trusty scm sub-directory
#FROM buildpack-deps:trusty-curl
FROM quay.io/tangfeixiong/ubuntu-14-04-3:curl

#RUN apt-get update && apt-get install -y --no-install-recommends \
#		bzr \
#		git \
#		mercurial \
#		openssh-client \
#		subversion \
#	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
                git \
                openssh-client \
        && rm -rf /var/lib/apt/lists/*
