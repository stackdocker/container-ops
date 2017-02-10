
Tables
-------

Pre-requisites

DevOps of __kubernetes__, including

* docker

* kubernetes

* etcd

* flannel

Hacking

Content
--------

### Pre-requisites

Base image

```
vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops$ docker pull ubuntu:14.04
14.04: Pulling from library/ubuntu
1ffb147f6784: Pull complete 
4137199b487e: Pull complete 
30f6abaa80df: Pull complete 
603e5288a026: Pull complete 
bcca47d920dd: Pull complete 
86edf2de857c: Pull complete 
Digest: sha256:761b0d464da7a6aa41f622bb94549714205c802601099417bfae4c8f665f7d02
Status: Downloaded newer image for ubuntu:14.04
```

### DevOps

Run interactive mode 

```
vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops/ubuntu-14-04-apt-mirror$ docker run -ti ubuntu:14.04 bash
root@189ffbb49487:/#
```

Using [official repo mirrors](https://launchpad.net/ubuntu/+archivemirrors), for example:
[aliyun](http://mirrors.aliyun.com/ubuntu)

Before

```
root@189ffbb49487:/# cat /etc/apt/sources.list
# See http://help.ubuntu.com/community/UpgradeNotes for how to upgrade to
# newer versions of the distribution.

deb http://archive.ubuntu.com/ubuntu/ trusty main restricted
deb-src http://archive.ubuntu.com/ubuntu/ trusty main restricted

## Major bug fix updates produced after the final release of the
## distribution.
deb http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted
deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates main restricted

## Uncomment the following two lines to add software from the 'universe'
## repository.
## N.B. software from this repository is ENTIRELY UNSUPPORTED by the Ubuntu
## team. Also, please note that software in universe WILL NOT receive any
## review or updates from the Ubuntu security team.
deb http://archive.ubuntu.com/ubuntu/ trusty universe
deb-src http://archive.ubuntu.com/ubuntu/ trusty universe
deb http://archive.ubuntu.com/ubuntu/ trusty-updates universe
deb-src http://archive.ubuntu.com/ubuntu/ trusty-updates universe

## N.B. software from this repository may not have been tested as
## extensively as that contained in the main release, although it includes
## newer versions of some applications which may provide useful features.
## Also, please note that software in backports WILL NOT receive any review
## or updates from the Ubuntu security team.
# deb http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted
# deb-src http://archive.ubuntu.com/ubuntu/ trusty-backports main restricted

deb http://archive.ubuntu.com/ubuntu/ trusty-security main restricted
deb-src http://archive.ubuntu.com/ubuntu/ trusty-security main restricted
deb http://archive.ubuntu.com/ubuntu/ trusty-security universe
deb-src http://archive.ubuntu.com/ubuntu/ trusty-security universe
# deb http://archive.ubuntu.com/ubuntu/ trusty-security multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ trusty-security multiverse
```

And `sed` it with:
```
root@189ffbb49487:/# sed -i 's%^deb http://archive.ubuntu.com/ubuntu/%deb http://mirrors.aliyun.com/ubuntu/%g;s%^deb-src http://archive.ubuntu.com/ubuntu/%deb-src http://mirrors.aliyun.com/ubuntu/%g' /etc/apt/sources.list
```

Then *re-index* repo list

```
root@189ffbb49487:/# apt-get update
Ign http://mirrors.aliyun.com trusty InRelease
Get:1 http://mirrors.aliyun.com trusty-updates InRelease [65.9 kB]
Get:2 http://mirrors.aliyun.com trusty-security InRelease [65.9 kB]            
Get:3 http://mirrors.aliyun.com trusty Release.gpg [933 B]                     
Get:4 http://mirrors.aliyun.com trusty-updates/main Sources [482 kB]           
Get:5 http://mirrors.aliyun.com trusty-updates/restricted Sources [5957 B]     
Get:6 http://mirrors.aliyun.com trusty-updates/universe Sources [217 kB]       
Get:7 http://mirrors.aliyun.com trusty-updates/main amd64 Packages [1173 kB]   
Get:8 http://mirrors.aliyun.com trusty-updates/restricted amd64 Packages [20.4 kB]
Get:9 http://mirrors.aliyun.com trusty-updates/universe amd64 Packages [511 kB]
Get:10 http://mirrors.aliyun.com trusty-security/main Sources [158 kB]         
Get:11 http://mirrors.aliyun.com trusty-security/restricted Sources [4667 B]   
Get:12 http://mirrors.aliyun.com trusty-security/universe Sources [57.6 kB]    
Get:13 http://mirrors.aliyun.com trusty-security/main amd64 Packages [711 kB]  
Get:14 http://mirrors.aliyun.com trusty-security/restricted amd64 Packages [17.0 kB]
Get:15 http://mirrors.aliyun.com trusty-security/universe amd64 Packages [197 kB]
Get:16 http://mirrors.aliyun.com trusty Release [58.5 kB]                      
Get:17 http://mirrors.aliyun.com trusty/main Sources [1335 kB]                 
Get:18 http://mirrors.aliyun.com trusty/restricted Sources [5335 B]            
Get:19 http://mirrors.aliyun.com trusty/universe Sources [7926 kB]             
Get:20 http://mirrors.aliyun.com trusty/main amd64 Packages [1743 kB]          
Get:21 http://mirrors.aliyun.com trusty/restricted amd64 Packages [16.0 kB]    
Get:22 http://mirrors.aliyun.com trusty/universe amd64 Packages [7589 kB]      
Fetched 22.4 MB in 1min 49s (204 kB/s)                                         
Reading package lists... Done

root@189ffbb49487:/# ls /var/lib/apt/lists
lock
mirrors.aliyun.com_ubuntu_dists_trusty-security_InRelease
mirrors.aliyun.com_ubuntu_dists_trusty-security_main_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty-security_main_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty-security_restricted_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty-security_restricted_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty-security_universe_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty-security_universe_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty-updates_InRelease
mirrors.aliyun.com_ubuntu_dists_trusty-updates_main_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty-updates_main_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty-updates_restricted_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty-updates_restricted_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty-updates_universe_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty-updates_universe_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty_Release
mirrors.aliyun.com_ubuntu_dists_trusty_Release.gpg
mirrors.aliyun.com_ubuntu_dists_trusty_main_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty_main_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty_restricted_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty_restricted_source_Sources.gz
mirrors.aliyun.com_ubuntu_dists_trusty_universe_binary-amd64_Packages.gz
mirrors.aliyun.com_ubuntu_dists_trusty_universe_source_Sources.gz
partial
```

Install *mirroring tool*

```
root@189ffbb49487:/# apt-cache showpkg apt-mirror
Package: apt-mirror
Versions: 
0.5.1-1 (/var/lib/apt/lists/mirrors.aliyun.com_ubuntu_dists_trusty_universe_binary-amd64_Packages.gz)
 Description Language: 
                 File: /var/lib/apt/lists/mirrors.aliyun.com_ubuntu_dists_trusty_universe_binary-amd64_Packages.gz
                  MD5: cf7ee1d4e4f7c65e0e14c5bc8da53c06


Reverse Depends: 
Dependencies: 
0.5.1-1 - adduser (0 (null)) perl-modules (0 (null)) wget (0 (null)) perl (0 (null)) 
Provides: 
0.5.1-1 - 
Reverse Provides: 

root@189ffbb49487:/# apt-get install -y apt-mirror
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  ca-certificates libidn11 openssl wget
The following NEW packages will be installed:
  apt-mirror ca-certificates libidn11 openssl wget
0 upgraded, 5 newly installed, 0 to remove and 2 not upgraded.
Need to get 1058 kB of archives.
After this operation, 2527 kB of additional disk space will be used.
Get:1 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main libidn11 amd64 1.28-1ubuntu2.1 [94.4 kB]
Get:2 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main openssl amd64 1.0.1f-1ubuntu2.21 [489 kB]
Get:3 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main ca-certificates all 20160104ubuntu0.14.04.1 [190 kB]
Get:4 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main wget amd64 1.15-1ubuntu1.14.04.2 [271 kB]
Get:5 http://mirrors.aliyun.com/ubuntu/ trusty/universe apt-mirror all 0.5.1-1 [13.6 kB]
Fetched 1058 kB in 9s (111 kB/s)                                               
Preconfiguring packages ...
Selecting previously unselected package libidn11:amd64.
(Reading database ... 11569 files and directories currently installed.)
Preparing to unpack .../libidn11_1.28-1ubuntu2.1_amd64.deb ...
Unpacking libidn11:amd64 (1.28-1ubuntu2.1) ...
Selecting previously unselected package openssl.
Preparing to unpack .../openssl_1.0.1f-1ubuntu2.21_amd64.deb ...
Unpacking openssl (1.0.1f-1ubuntu2.21) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20160104ubuntu0.14.04.1_all.deb ...
Unpacking ca-certificates (20160104ubuntu0.14.04.1) ...
Selecting previously unselected package wget.
Preparing to unpack .../wget_1.15-1ubuntu1.14.04.2_amd64.deb ...
Unpacking wget (1.15-1ubuntu1.14.04.2) ...
Selecting previously unselected package apt-mirror.
Preparing to unpack .../apt-mirror_0.5.1-1_all.deb ...
Unpacking apt-mirror (0.5.1-1) ...
Setting up libidn11:amd64 (1.28-1ubuntu2.1) ...
Setting up openssl (1.0.1f-1ubuntu2.21) ...
Setting up ca-certificates (20160104ubuntu0.14.04.1) ...
Setting up wget (1.15-1ubuntu1.14.04.2) ...
Setting up apt-mirror (0.5.1-1) ...
Processing triggers for libc-bin (2.19-0ubuntu6.9) ...
Processing triggers for ca-certificates (20160104ubuntu0.14.04.1) ...
Updating certificates in /etc/ssl/certs... 173 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d....done.

root@189ffbb49487:/# cat /etc/apt/mirror.list 
############# config ##################
#
# set base_path    /var/spool/apt-mirror
#
# set mirror_path  $base_path/mirror
# set skel_path    $base_path/skel
# set var_path     $base_path/var
# set cleanscript $var_path/clean.sh
# set defaultarch  <running host architecture>
# set postmirror_script $var_path/postmirror.sh
# set run_postmirror 0
set nthreads     20
set _tilde 0
#
############# end config ##############

deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
#deb http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
#deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

deb-src http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
#deb-src http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

clean http://archive.ubuntu.com/ubuntu
```

Disable mirroring of *Ubuntu Distribution*
Required of 60GiB+ disk

```
root@189ffbb49487:/# sed -i 's%^\(deb http://archive.ubuntu.com/ubuntu\).*$%# \0%;s%^\(deb-src http://archive.ubuntu.com/ubuntu\).*$%# \0%' /etc/apt/mirror.list 
````

Mirror packages for *kubernetes*

*Docker* repo

[The official installation guide](https://docs.docker.com/engine/installation/linux/ubuntu/)

```
root@189ffbb49487:/# docker_repo="http://mirrors.aliyun.com/docker-engine/apt/repo/" \
&& echo -e "\n### docker ###\n\
deb ${docker_repo} \
 ubuntu-$(cat /etc/lsb-release | grep 'DISTRIB_CODENAME' | cut -d= -f2) \
 main \n\
clean ${docker_repo}" | tee -a /etc/apt/mirror.list

root@189ffbb49487:/# apt-mirror 
Downloading 14 index files using 14 threads...
Begin time: Sat Jan 28 11:41:15 2017
[14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Sat Jan 28 11:41:19 2017

Processing tranlation indexes: [T]

Downloading 0 translation files using 0 threads...
Begin time: Sat Jan 28 11:41:19 2017
[0]... 
End time: Sat Jan 28 11:41:19 2017

Processing indexes: [P]

281.5 MiB will be downloaded into archive.
Downloading 27 archive files using 20 threads...
Begin time: Sat Jan 28 11:41:19 2017
[20]... [19]... [18]... [17]... [16]... [15]... [14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Sun Jan 29 02:36:36 2017

0 bytes in 0 files and 0 directories can be freed.
Run /var/spool/apt-mirror/var/clean.sh for this purpose.

Running the Post Mirror script ...
(/var/spool/apt-mirror/var/postmirror.sh)


Post Mirror script has completed. See above output for any possible errors.

root@189ffbb49487:/# ls /var/spool/apt-mirror/mirror/mirrors.aliyun.com/docker-engine/apt/repo/pool/main/d/docker-engine/
docker-engine_1.10.0-0~trusty_amd64.deb         docker-engine_1.13.0-0~ubuntu-trusty_amd64.deb
docker-engine_1.10.1-0~trusty_amd64.deb         docker-engine_1.5.0-0~trusty_amd64.deb
docker-engine_1.10.2-0~trusty_amd64.deb         docker-engine_1.6.0-0~trusty_amd64.deb
docker-engine_1.10.3-0~trusty_amd64.deb         docker-engine_1.6.1-0~trusty_amd64.deb
docker-engine_1.11.0-0~trusty_amd64.deb         docker-engine_1.6.2-0~trusty_amd64.deb
docker-engine_1.11.1-0~trusty_amd64.deb         docker-engine_1.7.0-0~trusty_amd64.deb
docker-engine_1.11.2-0~trusty_amd64.deb         docker-engine_1.7.1-0~trusty_amd64.deb
docker-engine_1.12.0-0~trusty_amd64.deb         docker-engine_1.8.0-0~trusty_amd64.deb
docker-engine_1.12.1-0~trusty_amd64.deb         docker-engine_1.8.1-0~trusty_amd64.deb
docker-engine_1.12.2-0~trusty_amd64.deb         docker-engine_1.8.2-0~trusty_amd64.deb
docker-engine_1.12.3-0~trusty_amd64.deb         docker-engine_1.8.3-0~trusty_amd64.deb
docker-engine_1.12.4-0~ubuntu-trusty_amd64.deb  docker-engine_1.9.0-0~trusty_amd64.deb
docker-engine_1.12.5-0~ubuntu-trusty_amd64.deb  docker-engine_1.9.1-0~trusty_amd64.deb
docker-engine_1.12.6-0~ubuntu-trusty_amd64.deb
```

Get *Docker apt GPG*

```
root@189ffbb49487:/# wget http://mirrors.aliyun.com/docker-engine/apt/gpg -O /var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg
--2017-01-29 03:58:25--  http://mirrors.aliyun.com/docker-engine/apt/gpg
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 115.28.122.210, 112.124.140.210
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|115.28.122.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1648 (1.6K) [application/octet-stream]
Saving to: '/var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg'

100%[====================================================================================>] 1,648       --.-K/s   in 0s      

2017-01-29 03:58:25 (241 MB/s) - '/var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg' saved [1648/1648]

root@189ffbb49487:/# cat /var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg
-----BEGIN PGP PUBLIC KEY BLOCK-----

mQINBFWln24BEADrBl5p99uKh8+rpvqJ48u4eTtjeXAWbslJotmC/CakbNSqOb9o
ddfzRvGVeJVERt/Q/mlvEqgnyTQy+e6oEYN2Y2kqXceUhXagThnqCoxcEJ3+KM4R
mYdoe/BJ/J/6rHOjq7Omk24z2qB3RU1uAv57iY5VGw5p45uZB4C4pNNsBJXoCvPn
TGAs/7IrekFZDDgVraPx/hdiwopQ8NltSfZCyu/jPpWFK28TR8yfVlzYFwibj5WK
dHM7ZTqlA1tHIG+agyPf3Rae0jPMsHR6q+arXVwMccyOi+ULU0z8mHUJ3iEMIrpT
X+80KaN/ZjibfsBOCjcfiJSB/acn4nxQQgNZigna32velafhQivsNREFeJpzENiG
HOoyC6qVeOgKrRiKxzymj0FIMLru/iFF5pSWcBQB7PYlt8J0G80lAcPr6VCiN+4c
NKv03SdvA69dCOj79PuO9IIvQsJXsSq96HB+TeEmmL+xSdpGtGdCJHHM1fDeCqkZ
hT+RtBGQL2SEdWjxbF43oQopocT8cHvyX6Zaltn0svoGs+wX3Z/H6/8P5anog43U
65c0A+64Jj00rNDr8j31izhtQMRo892kGeQAaaxg4Pz6HnS7hRC+cOMHUU4HA7iM
zHrouAdYeTZeZEQOA7SxtCME9ZnGwe2grxPXh/U/80WJGkzLFNcTKdv+rwARAQAB
tDdEb2NrZXIgUmVsZWFzZSBUb29sIChyZWxlYXNlZG9ja2VyKSA8ZG9ja2VyQGRv
Y2tlci5jb20+iQI4BBMBAgAiBQJVpZ9uAhsvBgsJCAcDAgYVCAIJCgsEFgIDAQIe
AQIXgAAKCRD3YiFXLFJgnbRfEAC9Uai7Rv20QIDlDogRzd+Vebg4ahyoUdj0CH+n
Ak40RIoq6G26u1e+sdgjpCa8jF6vrx+smpgd1HeJdmpahUX0XN3X9f9qU9oj9A4I
1WDalRWJh+tP5WNv2ySy6AwcP9QnjuBMRTnTK27pk1sEMg9oJHK5p+ts8hlSC4Sl
uyMKH5NMVy9c+A9yqq9NF6M6d6/ehKfBFFLG9BX+XLBATvf1ZemGVHQusCQebTGv
0C0V9yqtdPdRWVIEhHxyNHATaVYOafTj/EF0lDxLl6zDT6trRV5n9F1VCEh4Aal8
L5MxVPcIZVO7NHT2EkQgn8CvWjV3oKl2GopZF8V4XdJRl90U/WDv/6cmfI08GkzD
YBHhS8ULWRFwGKobsSTyIvnbk4NtKdnTGyTJCQ8+6i52s+C54PiNgfj2ieNn6oOR
7d+bNCcG1CdOYY+ZXVOcsjl73UYvtJrO0Rl/NpYERkZ5d/tzw4jZ6FCXgggA/Zxc
jk6Y1ZvIm8Mt8wLRFH9Nww+FVsCtaCXJLP8DlJLASMD9rl5QS9Ku3u7ZNrr5HWXP
HXITX660jglyshch6CWeiUATqjIAzkEQom/kEnOrvJAtkypRJ59vYQOedZ1sFVEL
MXg2UCkD/FwojfnVtjzYaTCeGwFQeqzHmM241iuOmBYPeyTY5veF49aBJA1gEJOQ
TvBR8Q==
=Fm3p
-----END PGP PUBLIC KEY BLOCK-----
```

*kubernetes* repo

[The official installation guide](https://kubernetes.io/docs/getting-started-guides/kubeadm/)

```
root@189ffbb49487:/# k8s_repo="http://mirrors.aliyun.com/kubernetes/apt/" \
&& echo -e "\n### kubernetes ###\n\
deb ${k8s_repo} \
 kubernetes-$(cat /etc/lsb-release | grep 'DISTRIB_CODENAME' | cut -d= -f2) \
 main \n\
clean ${k8s_repo}" | tee -a /etc/apt/mirror.list

root@189ffbb49487:/# apt-mirror 
Downloading 28 index files using 20 threads...
Begin time: Sun Jan 29 02:57:43 2017
[20]... [19]... [18]... [17]... [16]... [15]... [14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Sun Jan 29 02:57:47 2017

Processing tranlation indexes: [TT]

Downloading 0 translation files using 0 threads...
Begin time: Sun Jan 29 02:57:47 2017
[0]... 
End time: Sun Jan 29 02:57:47 2017

Processing indexes: [PP]

8.3 MiB will be downloaded into archive.
Downloading 1 archive files using 1 threads...
Begin time: Sun Jan 29 02:57:47 2017
[1]... [0]... 
End time: Sun Jan 29 02:58:15 2017

0 bytes in 0 files and 0 directories can be freed.
Run /var/spool/apt-mirror/var/clean.sh for this purpose.

Running the Post Mirror script ...
(/var/spool/apt-mirror/var/postmirror.sh)


Post Mirror script has completed. See above output for any possible errors.

root@189ffbb49487:/# k8s_repo="http://apt.kubernetes.io/" \
&& echo -e "\n### kubernetes ###\n\
deb ${k8s_repo} \
 kubernetes-$(cat /etc/lsb-release | grep 'DISTRIB_CODENAME' | cut -d= -f2) \
 main \n\
clean ${k8s_repo}" | tee -a /etc/apt/mirror.list
```

Get *kubernetes apt GPG*

```
root@189ffbb49487:/# wget http://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg -O /var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg
--2017-01-29 03:45:03--  http://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 115.28.122.210, 112.124.140.210
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|115.28.122.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 663 [application/octet-stream]
Saving to: '/var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg'

100%[====================================================================================>] 663         --.-K/s   in 0s      

2017-01-29 03:45:04 (92.0 MB/s) - '/var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg' saved [663/663]

```

Save mirroring Outside

```
root@189ffbb49487:/# exit
vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops/ubuntu-14-04-apt-mirror$ docker cp 189ffbb49487:/var/spool/apt-mirror /var/spool
```

### Hacking

Run mirroring into *Ubuntu* Docker container 

```
vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops/ubuntu-14-04-apt-mirror$ docker run --rm -t -v `pwd`/mirror-k8s-required-repo.sh:/run.sh -v /var/spool/apt-mirror:/var/spool/apt-mirror ubuntu:14.04 /run.sh
Ign http://mirrors.aliyun.com trusty InRelease
Get:1 http://mirrors.aliyun.com trusty-updates InRelease [65.9 kB]
Get:2 http://mirrors.aliyun.com trusty-security InRelease [65.9 kB]
Get:3 http://mirrors.aliyun.com trusty Release.gpg [933 B]    
Get:4 http://mirrors.aliyun.com trusty-updates/main Sources [482 kB]
Get:5 http://mirrors.aliyun.com trusty-updates/restricted Sources [5957 B]
Get:6 http://mirrors.aliyun.com trusty-updates/universe Sources [217 kB]
Get:7 http://mirrors.aliyun.com trusty-updates/main amd64 Packages [1173 kB]
Get:8 http://mirrors.aliyun.com trusty-updates/restricted amd64 Packages [20.4 kB]
Get:9 http://mirrors.aliyun.com trusty-updates/universe amd64 Packages [511 kB]
Get:10 http://mirrors.aliyun.com trusty-security/main Sources [158 kB]         
Get:11 http://mirrors.aliyun.com trusty-security/restricted Sources [4667 B]   
Get:12 http://mirrors.aliyun.com trusty-security/universe Sources [57.6 kB]    
Get:13 http://mirrors.aliyun.com trusty-security/main amd64 Packages [711 kB]  
Get:14 http://mirrors.aliyun.com trusty-security/restricted amd64 Packages [17.0 kB]
Get:15 http://mirrors.aliyun.com trusty-security/universe amd64 Packages [197 kB]
Get:16 http://mirrors.aliyun.com trusty Release [58.5 kB]                      
Get:17 http://mirrors.aliyun.com trusty/main Sources [1335 kB]                 
Get:18 http://mirrors.aliyun.com trusty/restricted Sources [5335 B]            
Get:19 http://mirrors.aliyun.com trusty/universe Sources [7926 kB]             
Get:20 http://mirrors.aliyun.com trusty/main amd64 Packages [1743 kB]          
Get:21 http://mirrors.aliyun.com trusty/restricted amd64 Packages [16.0 kB]    
Get:22 http://mirrors.aliyun.com trusty/universe amd64 Packages [7589 kB]      
Fetched 22.4 MB in 1min 13s (303 kB/s)                                         
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  ca-certificates libidn11 openssl wget
The following NEW packages will be installed:
  apt-mirror ca-certificates libidn11 openssl wget
0 upgraded, 5 newly installed, 0 to remove and 2 not upgraded.
Need to get 1058 kB of archives.
After this operation, 2527 kB of additional disk space will be used.
Get:1 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main libidn11 amd64 1.28-1ubuntu2.1 [94.4 kB]
Get:2 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main openssl amd64 1.0.1f-1ubuntu2.21 [489 kB]
Get:3 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main ca-certificates all 20160104ubuntu0.14.04.1 [190 kB]
Get:4 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main wget amd64 1.15-1ubuntu1.14.04.2 [271 kB]
Get:5 http://mirrors.aliyun.com/ubuntu/ trusty/universe apt-mirror all 0.5.1-1 [13.6 kB]
Fetched 1058 kB in 6s (174 kB/s)                                               
Preconfiguring packages ...
Selecting previously unselected package libidn11:amd64.
(Reading database ... 11569 files and directories currently installed.)
Preparing to unpack .../libidn11_1.28-1ubuntu2.1_amd64.deb ...
Unpacking libidn11:amd64 (1.28-1ubuntu2.1) ...
Selecting previously unselected package openssl.
Preparing to unpack .../openssl_1.0.1f-1ubuntu2.21_amd64.deb ...
Unpacking openssl (1.0.1f-1ubuntu2.21) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20160104ubuntu0.14.04.1_all.deb ...
Unpacking ca-certificates (20160104ubuntu0.14.04.1) ...
Selecting previously unselected package wget.
Preparing to unpack .../wget_1.15-1ubuntu1.14.04.2_amd64.deb ...
Unpacking wget (1.15-1ubuntu1.14.04.2) ...
Selecting previously unselected package apt-mirror.
Preparing to unpack .../apt-mirror_0.5.1-1_all.deb ...
Unpacking apt-mirror (0.5.1-1) ...
Setting up libidn11:amd64 (1.28-1ubuntu2.1) ...
Setting up openssl (1.0.1f-1ubuntu2.21) ...
Setting up ca-certificates (20160104ubuntu0.14.04.1) ...
Setting up wget (1.15-1ubuntu1.14.04.2) ...
Setting up apt-mirror (0.5.1-1) ...
Processing triggers for libc-bin (2.19-0ubuntu6.9) ...
Processing triggers for ca-certificates (20160104ubuntu0.14.04.1) ...
Updating certificates in /etc/ssl/certs... 173 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d....done.

### docker ###
deb http://mirrors.aliyun.com/docker-engine/apt/repo/  ubuntu-trusty  main 
clean http://mirrors.aliyun.com/docker-engine/apt/repo/
--2017-01-29 19:36:09--  http://mirrors.aliyun.com/docker-engine/apt/gpg
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 112.124.140.210, 115.28.122.210
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|112.124.140.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1648 (1.6K) [application/octet-stream]
Saving to: '/var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg'

100%[====================================================================================>] 1,648       --.-K/s   in 0s      

2017-01-29 19:36:09 (104 MB/s) - '/var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg' saved [1648/1648]


### kubernetes ###
deb http://mirrors.aliyun.com/kubernetes/apt/  kubernetes-trusty  main 
clean http://mirrors.aliyun.com/kubernetes/apt/
--2017-01-29 19:36:09--  http://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 115.28.122.210, 112.124.140.210
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|115.28.122.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 663 [application/octet-stream]
Saving to: '/var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg'

100%[====================================================================================>] 663         --.-K/s   in 0s      

2017-01-29 19:36:10 (82.0 MB/s) - '/var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg' saved [663/663]

Downloading 28 index files using 20 threads...
Begin time: Sun Jan 29 19:36:10 2017
[20]... [19]... [18]... [17]... [16]... [15]... [14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Sun Jan 29 19:36:11 2017

Processing tranlation indexes: [TT]

Downloading 0 translation files using 0 threads...
Begin time: Sun Jan 29 19:36:11 2017
[0]... 
End time: Sun Jan 29 19:36:11 2017

Processing indexes: [PP]

281.5 MiB will be downloaded into archive.
Downloading 27 archive files using 20 threads...
Begin time: Sun Jan 29 19:36:11 2017
[20]... [19]... [18]... [17]... [16]... [15]... [14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Sun Jan 29 19:55:21 2017

0 bytes in 0 files and 0 directories can be freed.
Run /var/spool/apt-mirror/var/clean.sh for this purpose.

Running the Post Mirror script ...
(/var/spool/apt-mirror/var/postmirror.sh)


Post Mirror script has completed. See above output for any possible errors.

vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops/ubuntu-14-04-apt-mirror$ ls -1 /var/spool/apt-mirror/mirror/
https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg
https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg
mirrors.aliyun.com

```

Run *docker build* into make a repo image 

```
vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops/ubuntu-14-04-apt-mirror$ docker build -t $(cat Makefile | grep '^IMG_NAME=' | cut -d= -f2) .
Sending build context to Docker daemon 37.38 kB
Step 1 : FROM ubuntu:14.04
 ---> 86edf2de857c
Step 2 : MAINTAINER tangfeixiong <tangfx128@gmail.com>
 ---> Running in 8842114123a7
 ---> fe2da4c35dd9
Removing intermediate container 8842114123a7
Step 3 : ADD ／mirror-k8s-required-repo.sh /run.sh
lstat ï¼mirror-k8s-required-repo.sh: no such file or directory
vagrant@vagrant-ubuntu-trusty-64:/work/src/github.com/stackdocker/container-ops/ubuntu-14-04-apt-mirror$ docker build -t $(cat Makefile | grep '^IMG_NAME=' | cut -d= -f2) .
Sending build context to Docker daemon 37.38 kB
Step 1 : FROM ubuntu:14.04
 ---> 86edf2de857c
Step 2 : MAINTAINER tangfeixiong <tangfx128@gmail.com>
 ---> Using cache
 ---> fe2da4c35dd9
Step 3 : ADD /mirror-k8s-required-repo.sh /run.sh
 ---> 207d8b9636ac
Removing intermediate container 626e2f8fec8a
Step 4 : RUN /run.sh     && apt-get install nginx     && mv /usr/share/nginx/html/* /usr/share/nginx/html/nginx-*     && ln -s /var/spool/apt-mirror/mirror /usr/share/nginx/html/ubuntu-$(cat /etc/os-release | grep 'VERSION=' | cut -d' ' -f3 | tr '[:upper:]' '[:lower:]')     && mkdir -p /usr/share/nginx/html/ubuntu/$(cat /etc/os-release | grep 'VERSION_ID=' | cut -d= -f2 | tr -d \")
 ---> Running in acf1ec9f138f
Ign http://mirrors.aliyun.com trusty InRelease
Get:1 http://mirrors.aliyun.com trusty-updates InRelease [65.9 kB]
Get:2 http://mirrors.aliyun.com trusty-security InRelease [65.9 kB]
Get:3 http://mirrors.aliyun.com trusty Release.gpg [933 B]
Get:4 http://mirrors.aliyun.com trusty-updates/main Sources [482 kB]
Get:5 http://mirrors.aliyun.com trusty-updates/restricted Sources [5957 B]
Get:6 http://mirrors.aliyun.com trusty-updates/universe Sources [217 kB]
Get:7 http://mirrors.aliyun.com trusty-updates/main amd64 Packages [1173 kB]
Get:8 http://mirrors.aliyun.com trusty-updates/restricted amd64 Packages [20.4 kB]
Get:9 http://mirrors.aliyun.com trusty-updates/universe amd64 Packages [511 kB]
Get:10 http://mirrors.aliyun.com trusty-security/main Sources [158 kB]
Get:11 http://mirrors.aliyun.com trusty-security/restricted Sources [4667 B]
Get:12 http://mirrors.aliyun.com trusty-security/universe Sources [57.6 kB]
Get:13 http://mirrors.aliyun.com trusty-security/main amd64 Packages [711 kB]
Get:14 http://mirrors.aliyun.com trusty-security/restricted amd64 Packages [17.0 kB]
Get:15 http://mirrors.aliyun.com trusty-security/universe amd64 Packages [197 kB]
Get:16 http://mirrors.aliyun.com trusty Release [58.5 kB]
Get:17 http://mirrors.aliyun.com trusty/main Sources [1335 kB]
Get:18 http://mirrors.aliyun.com trusty/restricted Sources [5335 B]
Get:19 http://mirrors.aliyun.com trusty/universe Sources [7926 kB]
Get:20 http://mirrors.aliyun.com trusty/main amd64 Packages [1743 kB]
Get:21 http://mirrors.aliyun.com trusty/restricted amd64 Packages [16.0 kB]
Get:22 http://mirrors.aliyun.com trusty/universe amd64 Packages [7589 kB]
Fetched 22.4 MB in 24min 42s (15.1 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
Reading state information...
The following extra packages will be installed:
  ca-certificates libidn11 openssl wget
The following NEW packages will be installed:
  apt-mirror ca-certificates libidn11 openssl wget
0 upgraded, 5 newly installed, 0 to remove and 2 not upgraded.
Need to get 1058 kB of archives.
After this operation, 2527 kB of additional disk space will be used.
Get:1 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main libidn11 amd64 1.28-1ubuntu2.1 [94.4 kB]
Get:2 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main openssl amd64 1.0.1f-1ubuntu2.21 [489 kB]
Get:3 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main ca-certificates all 20160104ubuntu0.14.04.1 [190 kB]
Get:4 http://mirrors.aliyun.com/ubuntu/ trusty-updates/main wget amd64 1.15-1ubuntu1.14.04.2 [271 kB]
Get:5 http://mirrors.aliyun.com/ubuntu/ trusty/universe apt-mirror all 0.5.1-1 [13.6 kB]
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
dpkg-preconfigure: unable to re-open stdin: 
Fetched 1058 kB in 51s (20.7 kB/s)
Selecting previously unselected package libidn11:amd64.
(Reading database ... 11569 files and directories currently installed.)
Preparing to unpack .../libidn11_1.28-1ubuntu2.1_amd64.deb ...
Unpacking libidn11:amd64 (1.28-1ubuntu2.1) ...
Selecting previously unselected package openssl.
Preparing to unpack .../openssl_1.0.1f-1ubuntu2.21_amd64.deb ...
Unpacking openssl (1.0.1f-1ubuntu2.21) ...
Selecting previously unselected package ca-certificates.
Preparing to unpack .../ca-certificates_20160104ubuntu0.14.04.1_all.deb ...
Unpacking ca-certificates (20160104ubuntu0.14.04.1) ...
Selecting previously unselected package wget.
Preparing to unpack .../wget_1.15-1ubuntu1.14.04.2_amd64.deb ...
Unpacking wget (1.15-1ubuntu1.14.04.2) ...
Selecting previously unselected package apt-mirror.
Preparing to unpack .../apt-mirror_0.5.1-1_all.deb ...
Unpacking apt-mirror (0.5.1-1) ...
Setting up libidn11:amd64 (1.28-1ubuntu2.1) ...
Setting up openssl (1.0.1f-1ubuntu2.21) ...
Setting up ca-certificates (20160104ubuntu0.14.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (TERM is not set, so the dialog frontend is not usable.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Readline
debconf: (This frontend requires a controlling tty.)
debconf: falling back to frontend: Teletype
Setting up wget (1.15-1ubuntu1.14.04.2) ...
Setting up apt-mirror (0.5.1-1) ...
Processing triggers for libc-bin (2.19-0ubuntu6.9) ...
Processing triggers for ca-certificates (20160104ubuntu0.14.04.1) ...
Updating certificates in /etc/ssl/certs... 173 added, 0 removed; done.
Running hooks in /etc/ca-certificates/update.d....done.

### docker ###
deb http://mirrors.aliyun.com/docker-engine/apt/repo/  ubuntu-trusty  main 
clean http://mirrors.aliyun.com/docker-engine/apt/repo/
--2017-01-30 21:48:42--  http://mirrors.aliyun.com/docker-engine/apt/gpg
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 115.28.122.210, 112.124.140.210
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|115.28.122.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1648 (1.6K) [application/octet-stream]
Saving to: '/var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg'

     0K .                                                     100% 3.68M=0s

2017-01-30 21:48:43 (3.68 MB/s) - '/var/spool/apt-mirror/mirror/https%3A%2F%2Fapt%2Edockerproject%2Eorg%2Fgpg' saved [1648/1648]


### kubernetes ###
deb http://mirrors.aliyun.com/kubernetes/apt/  kubernetes-trusty  main 
clean http://mirrors.aliyun.com/kubernetes/apt/
--2017-01-30 21:48:43--  http://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg
Resolving mirrors.aliyun.com (mirrors.aliyun.com)... 115.28.122.210, 112.124.140.210
Connecting to mirrors.aliyun.com (mirrors.aliyun.com)|115.28.122.210|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 663 [application/octet-stream]
Saving to: '/var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg'

     0K                                                       100% 62.9M=0s

2017-01-30 21:48:45 (62.9 MB/s) - '/var/spool/apt-mirror/mirror/https%3A%2F%2Fpackages%2Ecloud%2Egoogle%2Ecom%2Fapt%2Fdoc%2Fapt-key.gpg' saved [663/663]

Downloading 28 index files using 20 threads...
Begin time: Mon Jan 30 21:48:45 2017
[20]... [19]... [18]... [17]... [16]... [15]... [14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Mon Jan 30 21:48:49 2017

Processing tranlation indexes: [TT]

Downloading 0 translation files using 0 threads...
Begin time: Mon Jan 30 21:48:49 2017
[0]... 
End time: Mon Jan 30 21:48:49 2017

Processing indexes: [PP]

281.5 MiB will be downloaded into archive.
Downloading 27 archive files using 20 threads...
Begin time: Mon Jan 30 21:48:49 2017
[20]... [19]... [18]... [17]... [16]... [15]... [14]... [13]... [12]... [11]... [10]... [9]... [8]... [7]... [6]... [5]... [4]... [3]... [2]... [1]... [0]... 
End time: Mon Jan 30 22:37:04 2017

0 bytes in 0 files and 0 directories can be freed.
Run /var/spool/apt-mirror/var/clean.sh for this purpose.

Running the Post Mirror script ...
(/var/spool/apt-mirror/var/postmirror.sh)


Post Mirror script has completed. See above output for any possible errors.

Reading package lists...
Building dependency tree...
Reading state information...
The following extra packages will be installed:
  fontconfig-config fonts-dejavu-core geoip-database libfontconfig1
  libfreetype6 libgd3 libgeoip1 libjbig0 libjpeg-turbo8 libjpeg8 libtiff5
  libvpx1 libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxml2 libxpm4
  libxslt1.1 nginx-common nginx-core sgml-base xml-core
Suggested packages:
  libgd-tools geoip-bin fcgiwrap nginx-doc sgml-base-doc debhelper
The following NEW packages will be installed:
  fontconfig-config fonts-dejavu-core geoip-database libfontconfig1
  libfreetype6 libgd3 libgeoip1 libjbig0 libjpeg-turbo8 libjpeg8 libtiff5
  libvpx1 libx11-6 libx11-data libxau6 libxcb1 libxdmcp6 libxml2 libxpm4
  libxslt1.1 nginx nginx-common nginx-core sgml-base xml-core
0 upgraded, 25 newly installed, 0 to remove and 2 not upgraded.
Need to get 5591 kB of archives.
After this operation, 19.8 MB of additional disk space will be used.
