#!/bin/bash

set -e

echo "Usage: $0 repo[:tag] war [[base-image-tar] tomcat-archive]
        Note:
        Basically, it use 'java:8u72-jre-alpine' to build target, and will pull
it when not ready, or provide local archive with absolute path. Such as Tomcat. 
" >/dev/stderr

if [ $# -eq 0 ]; then
	exit 1
fi

HUB_REPO_IMG=$1

IFS=':' read -a hri_ARRAY <<< "$HUB_REPO_IMG"

HUB_REPO=${hri_ARRAY[0]}
IMG_TAG=latest
if [[ ! -z ${hri_ARRAY[1]} ]]; then
	IMG_TAG=${hri_ARRAY[1]}
fi

WAR_PATH=$2

BASE_IMG=java:8u72-jre-alpine
echo "Find out base image '"${BASE_IMG}"'..."
if [[ ! -z $(docker images -q ${BASE_IMG}) ]]; then
	echo "---- Ready!"
else
	if [[ 3 -lt $# ]]; then
		docker load -i $3
	else
		echo "Java base not found, pull..."
		docker pull ${BASE_IMG}
	fi
fi

SCRIPT_PATH=$(dirname "${BASH_SOURCE}")

TOMCAT_VERSION=8.0.32
TOMCAT_TGZ="apache-tomcat-${TOMCAT_VERSION}.tar.gz"
if [[ 2 -lt $# ]]; then
	if [[ 3 -lt $# ]]; then
		TOMCAT_TGZ=$4
	else
		TOMCAT_TGZ=$3
	fi
else
	echo "Tomcat archive not found, download..."
	curl -o $SCRIPT_PATH/$TOMCAT_TGZ  -fSL "http://apache.fayea.com/tomcat/tomcat-8/v8.0.32/bin/${TOMCAT_TGZ}"
	TOMCAT_TGZ=${SCRIPT_PATH}/${TOMCAT_TGZ}
fi
	
tgt=$(mktemp -d)

cat <<DF >${tgt}/Dockerfile
FROM ${BASE_IMG}

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH \$CATALINA_HOME/bin:\$PATH
RUN mkdir -p "\$CATALINA_HOME"
WORKDIR \$CATALINA_HOME

# see https://www.apache.org/dist/tomcat/tomcat-8/KEYS
#RUN set -ex \
#	&& for key in \
#		05AB33110949707C93A279E3D3EFE6B686867BA6 \
#		07E48665A34DCAFAE522E5E6266191C37C037D42 \
#		47309207D818FFD8DCD3F83F1931D684307A10A5 \
#		541FBE7D8F78B25E055DDEE13C370389288584E7 \
#		61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
#		79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
#		9BA44C2621385CB966EBA586F72C284D731FABEE \
#		A27677289986DB50844682F8ACB77FC2E86E29AC \
#		A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
#		DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
#		F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
#		F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 \
#	; do \
#		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
#	done
#
#ENV TOMCAT_MAJOR 8
#ENV TOMCAT_VERSION 8.0.32

#RUN set -x \
#	&& cp tomcat.tar.gz . \
#	&& tar -xvf tomcat.tar.gz \
#	&& rm bin/*.bat \
#	&& rm tomcat.tar.gz*
#ADD $(basename "$WAR_PATH") webapps
ADD tomcat/ .

EXPOSE 8080
CMD ["catalina.sh", "run"]

DF

cp ${TOMCAT_TGZ} $tgt/tomcat.tar.gz \
	&& mkdir -p $tgt/tomcat \
	&& tar -C $tgt/tomcat -xvf $tgt/tomcat.tar.gz --strip-components=1 \
	&& rm $tgt/tomcat/bin/*.bat 
#cp $WAR_PATH $tgt/$(basename "$WAR_PATH")
cp $WAR_PATH $tgt/tomcat/webapps/$(basename "$WAR_PATH")

docker build -t ${HUB_REPO}:${IMG_TAG} $tgt

rm -rf $tgt
