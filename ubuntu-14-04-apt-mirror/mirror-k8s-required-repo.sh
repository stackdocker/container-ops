#!/bin/bash

set -e

sed -i 's%^deb http://archive.ubuntu.com/ubuntu/%deb http://mirrors.aliyun.com/ubuntu/%g;s%^deb-src http://archive.ubuntu.com/ubuntu/%deb-src http://mirrors.aliyun.com/ubuntu/%g' /etc/apt/sources.list

apt-get update

apt-get install -y apt-mirror

sed -i 's%^\(deb http://archive.ubuntu.com/ubuntu\).*$%# \0%;s%^\(deb-src http://archive.ubuntu.com/ubuntu\).*$%# \0%' /etc/apt/mirror.list


docker_repo="http://mirrors.aliyun.com/docker-engine/apt/repo/" \
&& echo -e "\n### docker ###\n\
deb ${docker_repo} \
 ubuntu-$(cat /etc/lsb-release | grep 'DISTRIB_CODENAME' | cut -d= -f2) \
 main \n\
clean ${docker_repo}" | tee -a /etc/apt/mirror.list

wget http://mirrors.aliyun.com/docker-engine/apt/gpg -O /var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg


k8s_repo="http://mirrors.aliyun.com/kubernetes/apt/" \
&& echo -e "\n### kubernetes ###\n\
deb ${k8s_repo} \
 kubernetes-$(cat /etc/lsb-release | grep 'DISTRIB_CODENAME' | cut -d= -f2) \
 main \n\
clean ${k8s_repo}" | tee -a /etc/apt/mirror.list


wget http://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg -O /var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg


apt-mirror

