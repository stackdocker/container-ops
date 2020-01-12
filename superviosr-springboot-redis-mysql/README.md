# Docker image for SpringBoot webapp implementing non-Internet env

## Table of contents

Work with image](#Work-with-Docker-image-of-Springboot-Webapp)
    1. Make
    1. Pre-build
    1. Test
    1. Issue

 Work with non-Internet](#Work-offline)
    1. Install Docker locally
    1. Maven build locally
    1. Mount fresh jar/war when re-executing Docker run

Work with all-in-one image with Supervisor
    1. [./all-in-supervisord.md](./all-in-supervisord.md)

__Reference__

Supervisor
- https://docs.docker.com/config/containers/multi-service_container/
- https://github.com/Supervisor/supervisor/blob/master/supervisor/skel/sample.conf

Dockerfile.all-in-one.ubuntu
- https://github.com/docker-library/mysql/blob/6659750146b7a6b91a96c786729b4d482cf49fe6/5.7/Dockerfile
- https://github.com/docker-library/redis/blob/b6d413ceff3a2bca10a430ace121597fa8fe2a2c/4.0/Dockerfile

Dockerfile.mysql.oraclelinux
- https://github.com/mysql/mysql-docker/blob/mysql-server/5.7/Dockerfile

Maven plugin for Docker
- https://github.com/fabric8io/docker-maven-plugin
- https://github.com/spotify/docker-maven-plugin
- https://github.com/spotify/dockerfile-maven

## Work with Docker image of Springboot Webapp

First put target _jar/war_ in this directory

Then modify _Makefile_ for it. An initial app in example is called `webppdemo.war`, which shipped with a build argument named **TARGET_ARCHIVE**, see bellowing example. In _Dockerfile.springboot-webapp_, the init build argument is `/target/example.war` but its same Env Var is "webapp.war". Note Docker build and run will fail with default settings.

Also _MariaDB_ and _Redis_ are shipped in _Dockerfile.springboot-webapp_ and _Makefile_, remove relative lines if not required.

At last, simply run `make build-springboot-webapp`

For example
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ make build-springboot-webapp
if [ -n "" ]; then \
  /usr/bin/docker rmi nebroad/test; \
fi
/usr/bin/docker build --force-rm --no-cache --rm \
  --build-arg TARGET_ARCHIVE=/webappdemo.war \
  --build-arg SPRING_DATASOURCE_URL=jdbc:mysql://mysql:3306/demodb \
  --build-arg SPRING_DATASOURCE_USERNAME=demo \
  --build-arg SPRING_DATASOURCE_PASSWORD=DEMO_PASSWORD \
  --build-arg SPRING_REDIS_HOST=redis \
  --build-arg SPRING_REDIS_PORT=6379 \
  --build-arg SPRING_REDIS_DATABASE=0 \
  --build-arg SPRING_CACHE_TYPE=NONE \
  -t nebroad/test -f Dockerfile.springboot-webapp .
Sending build context to Docker daemon  204.7MB
Step 1/19 : FROM openjdk:8u232-jdk
 ---> 09df0563bdfc
Step 2/19 : LABEL maintainer="tangfeixiong <tangfx128@gmail.com>"       project="https://github.com/stackdocker/container-ops"       namespace="supervisor-springboot-redis-mysql"       name="springboot-webapp"       annotations='{"stackdocker.io/created-by":"n/a"}'       tags="openjdk8 springboot mybatis mariadb"
 ---> Running in c6c50971eb2a
Removing intermediate container c6c50971eb2a
 ---> ed05d2643123
Step 3/19 : ARG SPRING_DATASOURCE_URL
 ---> Running in 78a5acb2ef76
Removing intermediate container 78a5acb2ef76
 ---> 8472de77b49b
Step 4/19 : ARG SPRING_DATASOURCE_USERNAME
 ---> Running in af7a320c3622
Removing intermediate container af7a320c3622
 ---> a4396114f9c1
Step 5/19 : ARG SPRING_DATASOURCE_PASSWORD
 ---> Running in a017056ec55d
Removing intermediate container a017056ec55d
 ---> c446dfa4a2a4
Step 6/19 : ARG SPRING_REDIS_HOST
 ---> Running in 0b9157d413c5
Removing intermediate container 0b9157d413c5
 ---> d82b0fe875a1
Step 7/19 : ARG SPRING_REDIS_PORT
 ---> Running in 81a8b2a1ecb4
Removing intermediate container 81a8b2a1ecb4
 ---> 26c2e3cbd6ac
Step 8/19 : ARG SPRING_REDIS_DATABASE
 ---> Running in 1cb281c95e0d
Removing intermediate container 1cb281c95e0d
 ---> 3062b86b6edd
Step 9/19 : ARG SPRING_CACHE_TYPE
 ---> Running in eaae47776781
Removing intermediate container eaae47776781
 ---> b958a0699160
Step 10/19 : ARG SERVER_PORT
 ---> Running in 6d7305a3a8da
Removing intermediate container 6d7305a3a8da
 ---> 5331c9bb6597
Step 11/19 : ARG JAVA_OPTIONS
 ---> Running in ce3abc0061fd
Removing intermediate container ce3abc0061fd
 ---> 1f525788ed40
Step 12/19 : ARG TARGET_ARCHIVE
 ---> Running in 9dfe8ace0537
Removing intermediate container 9dfe8ace0537
 ---> 021e9321ea1d
Step 13/19 : COPY "${TARGET_ARCHIVE:-/target/example.jar}" /tmp/
 ---> 21684b9f6bba
Step 14/19 : ENV JAVA_OPTIONS="${JAVA_OPTIONS:--Xms128m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m}"     SPRING_DATASOURCE_URL="${SPRING_DATASOURCE_URL:-jdbc:mysql://127.0.0.1:3306/testdb}"     SPRING_DATASOURCE_USERNAME="${SPRING_DATASOURCE_USERNAME:-demo}"     SPRING_DATASOURCE_PASSWORD="${SPRING_DATASOURCE_PASSWORD:-DEMO_PASSWORD}" 	SRPING_REDIS_HOST="${SPRING_REDIS_HOST:-localhost}" 	SPRING_REDIS_PORT="${SPRING_REDIS_PORT:-6379}"SPRING_REDIS_DATABASE="${SPRING_REDIS_DATABASE:-0}" 	SPRING_CACHE_TYPE="${SPRING_CACHE_TYPE:-REDIS}"     SERVER_PORT="${SERVER_PORT:-8080}" 	TARGET_ARCHIVE="${TARGET_ARCHIVE:-webapp.war}"
 ---> Running in 9ce94036e278
Removing intermediate container 9ce94036e278
 ---> 906d91b60560
Step 15/19 : RUN set -ex;     { export linux_distro="$(awk -F= '/^NAME/{print $2}' /etc/os-release)"; 	if [ "$linux_distro" = '"Ubuntu"' -o "$linux_distro" = '"Debian GNU/Linux"' ]; then 	    apt-get update; 	    DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends 	    ca-certificates 		    wget 		    net-tools 		    openssl 		    tzdata 	    && rm -rf /var/lib/apt/lists/*; 	    echo $TZ > /etc/timezone 	    && rm -f /etc/localtime 	    && ln -fs /usr/share/zoneinfo/$TZ /etc/localtime 	    && dpkg-reconfigure -f noninteractive tzdata; 		[ -n $JAVA_VERSION ] || apt-get install openjdk-8-jdk-headless; 	elif [ "${linux_distro}" = '"CentOS Linux"' ]; then         install_Pkgs="             tar             unzip             bc             which             lsof             java-1.8.0-openjdk         "         && yum install -y $install_Pkgs         && yum clean all -y; 	else 	    echo "Unexpected Linux distro"; 		exit 1; 	fi }; 		echo
 ---> Running in e18df77a602a
+ awk -F= /^NAME/{print $2} /etc/os-release
+ export linux_distro="Debian GNU/Linux"
+ [ "Debian GNU/Linux" = "Ubuntu" -o "Debian GNU/Linux" = "Debian GNU/Linux" ]
+ apt-get update
Ign:1 http://deb.debian.org/debian stretch InRelease
Get:2 http://deb.debian.org/debian stretch-updates InRelease [91.0 kB]
Get:3 http://security.debian.org/debian-security stretch/updates InRelease [94.3 kB]
Get:4 http://deb.debian.org/debian stretch Release [118 kB]
Get:5 http://deb.debian.org/debian stretch-updates/main amd64 Packages [27.9 kB]
Get:6 http://security.debian.org/debian-security stretch/updates/main amd64 Packages [513 kB]
Get:7 http://deb.debian.org/debian stretch Release.gpg [2365 B]
Get:8 http://deb.debian.org/debian stretch/main amd64 Packages [7086 kB]
Fetched 7933 kB in 22s (351 kB/s)
Reading package lists...
+ DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ca-certificates wget net-tools openssl tzdata
Reading package lists...
Building dependency tree...
Reading state information...
ca-certificates is already the newest version (20161130+nmu1+deb9u1).
wget is already the newest version (1.18-5+deb9u3).
openssl is already the newest version (1.1.0l-1~deb9u1).
openssl set to manually installed.
tzdata is already the newest version (2019c-0+deb9u1).
tzdata set to manually installed.
The following NEW packages will be installed:
  net-tools
0 upgraded, 1 newly installed, 0 to remove and 5 not upgraded.
Need to get 248 kB of archives.
After this operation, 963 kB of additional disk space will be used.
Get:1 http://deb.debian.org/debian stretch/main amd64 net-tools amd64 1.60+git20161116.90da8a0-1 [248 kB]
debconf: delaying package configuration, since apt-utils is not installed
Fetched 248 kB in 0s (302 kB/s)
Selecting previously unselected package net-tools.
(Reading database ... 12447 files and directories currently installed.)
Preparing to unpack .../net-tools_1.60+git20161116.90da8a0-1_amd64.deb ...
Unpacking net-tools (1.60+git20161116.90da8a0-1) ...
Setting up net-tools (1.60+git20161116.90da8a0-1) ...
+ rm -rf /var/lib/apt/lists/deb.debian.org_debian_dists_stretch-updates_InRelease /var/lib/apt/lists/deb.debian.org_debian_dists_stretch-updates_main_binary-amd64_Packages.lz4 /var/lib/apt/lists/deb.debian.org_debian_dists_stretch_Release /var/lib/apt/lists/deb.debian.org_debian_dists_stretch_Release.gpg /var/lib/apt/lists/deb.debian.org_debian_dists_stretch_main_binary-amd64_Packages.lz4 /var/lib/apt/lists/lock /var/lib/apt/lists/partial /var/lib/apt/lists/security.debian.org_debian-security_dists_stretch_updates_InRelease /var/lib/apt/lists/security.debian.org_debian-security_dists_stretch_updates_main_binary-amd64_Packages.lz4
+ echo
+ rm -f /etc/localtime
+ ln -fs /usr/share/zoneinfo/ /etc/localtime
+ dpkg-reconfigure -f noninteractive tzdata

Current default time zone: 'Etc/UTC'
Local time is now:      Sun Jan 12 02:05:37 UTC 2020.
Universal Time is now:  Sun Jan 12 02:05:37 UTC 2020.

+ [ -n 8u232 ]
+ echo

Removing intermediate container e18df77a602a
 ---> 744aad843d66
Step 16/19 : RUN set -ex;     mkdir /springboot;     touch /springboot/run.sh     && echo '#!/bin/bash \n    if [ -z $(find /springboot -name "*.?ar") ]; then \n        cp /tmp/*.?ar /springboot/ ; \n    fi \n    export TARGET_ARCHIVE=$(find /springboot -name "*.?ar" -print | grep "$TARGET_ARCHIVE") \n    exec java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTIONS -jar $TARGET_ARCHIVE'            >> /springboot/run.sh 	&& chmod +x /springboot/run.sh
 ---> Running in b09d9d06c095
+ mkdir /springboot
+ touch /springboot/run.sh
+ echo #!/bin/bash \n    if [ -z $(find /springboot -name "*.?ar") ]; then \n        cp /tmp/*.?ar /springboot/ ; \n    fi \n    export TARGET_ARCHIVE=$(find /springboot -name "*.?ar" -print | grep "$TARGET_ARCHIVE") \n    exec java -Djava.security.egd=file:/dev/./urandom $JAVA_OPTIONS -jar $TARGET_ARCHIVE
+ chmod +x /springboot/run.sh
Removing intermediate container b09d9d06c095
 ---> 9e021c345d5b
Step 17/19 : VOLUME /springboot
 ---> Running in f24cd56ab2b1
Removing intermediate container f24cd56ab2b1
 ---> 646a42cba3f0
Step 18/19 : EXPOSE ${SERVER_PORT:-8080}
 ---> Running in 77bf063006a2
Removing intermediate container 77bf063006a2
 ---> e1fd52761ced
Step 19/19 : CMD ["/springboot/run.sh"]
 ---> Running in cedd94927601
Removing intermediate container cedd94927601
 ---> ec107655001f
Successfully built ec107655001f
Successfully tagged nebroad/test:latest
```

Output
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker images nebroad/test
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nebroad/test        latest              ec107655001f        3 hours ago         567MB
```

### Pre-build

Image
```
docker pull docker.io/tangfeixiong/nebroad-test:springboot-webapp
```

additional
```
docker tang docker.io/tangfeixiong/nebroad-test:springboot-webapp nebroad/test
```

### Test

For example
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker run -d -P --name=sbwebapptest nebroad/test
28d6996b0d5ff3975536f163072bd8e4aa41ea4e70cf22ebbfeaebccf0575f74
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker logs sbwebapptest
OpenJDK 64-Bit Server VM warning: ignoring option PermSize=128m; support was removed in 8.0
OpenJDK 64-Bit Server VM warning: ignoring option MaxPermSize=256m; support was removed in 8.0
log4j:WARN No appenders could be found for logger (org.springframework.web.context.support.StandardServletEnvironment).
log4j:WARN Please initialize the log4j system properly.
log4j:WARN See http://logging.apache.org/log4j/1.2/faq.html#noconfig for more info.
SLF4J: Class path contains multiple SLF4J bindings.
SLF4J: Found binding in [jar:file:/springboot/webappdemo.war!/WEB-INF/lib/logback-classic-1.2.3.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: Found binding in [jar:file:/springboot/webappdemo.war!/WEB-INF/lib/slf4j-log4j12-1.7.25.jar!/org/slf4j/impl/StaticLoggerBinder.class]
SLF4J: See http://www.slf4j.org/codes.html#multiple_bindings for an explanation.
SLF4J: Actual binding is of type [ch.qos.logback.classic.util.ContextSelectorStaticBinder]

  .   ____          _            __ _ _
 /\\ / ___'_ __ _ _(_)_ __  __ _ \ \ \ \
( ( )\___ | '_ | '_| | '_ \/ _` | \ \ \ \
 \\/  ___)| |_)| | | | | || (_| |  ) ) ) )
  '  |____| .__|_| |_|_| |_\__, | / / / /
 =========|_|==============|___/=/_/_/_/
 :: Spring Boot ::        (v2.0.1.RELEASE)

2020-01-12 01:39:05.557  INFO 1 --- [           main] .s.d.r.c.RepositoryConfigurationDelegate : Multiple Spring Data modules found, entering strict repository configuration mode!
2020-01-12 01:39:07.562  INFO 1 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2020-01-12 01:39:07.563  INFO 1 --- [           main] org.apache.catalina.core.StandardEngine  : Starting Servlet Engine: Apache Tomcat/9.0.7
2020-01-12 01:39:07.575  INFO 1 --- [           main] o.a.catalina.core.AprLifecycleListener   : The APR based Apache Tomcat Native library which allows optimal performance in production environments was not found on the java.library.path: [/usr/java/packages/lib/amd64:/usr/lib64:/lib64:/lib:/usr/lib]
2020-01-12 01:39:09.921  INFO 1 --- [           main] org.apache.jasper.servlet.TldScanner     : At least one JAR was scanned for TLDs yet contained no TLDs. Enable debug logging for this logger for a complete list of JARs that were scanned but no TLDs were found in them. Skipping unneeded JARs during scanning can improve startup time and JSP compilation time.
2020-01-12 01:39:10.456  INFO 1 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                                                                 NAMES
28d6996b0d5f        nebroad/test        "/springboot/run.sh"     17 seconds ago      Up 16 seconds       0.0.0.0:32873->8080/tcp                                                                               sbwebapptest
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ curl http://127.0.0.1:32873

<!DOCTYPE html>
<html lang="zh">

>>> snippets >>>
```

Destroy
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker stop sbwebapptest && docker rm sbwebapptest
sbwebapptest
sbwebapptest
```

### Issue

Command `make` not found

For example
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ make build-springboot-webapp

Command 'make' not found, but can be installed with:

apt install make      
apt install make-guile

Ask your administrator to install one of them.
```

Ubuntu make package
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ sudo apt-get install make
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.15.0-70 linux-headers-4.15.0-70-generic linux-image-4.15.0-70-generic linux-modules-4.15.0-70-generic
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  make-doc
The following NEW packages will be installed:
  make
0 upgraded, 1 newly installed, 0 to remove and 33 not upgraded.
Need to get 154 kB of archives.
After this operation, 381 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu bionic/main amd64 make amd64 4.1-9.1ubuntu1 [154 kB]
Fetched 154 kB in 3s (45.3 kB/s)
Selecting previously unselected package make.
(Reading database ... 121839 files and directories currently installed.)
Preparing to unpack .../make_4.1-9.1ubuntu1_amd64.deb ...
Unpacking make (4.1-9.1ubuntu1) ...
Setting up make (4.1-9.1ubuntu1) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
```

## Work offline

### Docker offline 

Download packages
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ make get-docker-packages
make -C deb-pkg download
make[1]: Entering directory '/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql/deb-pkg'
make[1]: Warning: File 'Makefile' has modification time 7577 s in the future
apt-get download docker.io docker-compose
Get:1 http://archive.ubuntu.com/ubuntu bionic/universe amd64 docker-compose all 1.17.1-2 [76.3 kB]
Get:2 http://archive.ubuntu.com/ubuntu bionic-updates/universe amd64 docker.io amd64 18.09.7-0ubuntu1~18.04.4 [30.7 MB]
Fetched 30.8 MB in 26s (1173 kB/s)                                                                                                                    
make[1]: Leaving directory '/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql/deb-pkg'
```

### Maven build

For example
```
mvn clean package spring-boot:repackage --no-snapshot-updates --offline
```

### Docker image

Output image to tar or Vice Versa
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ make img-to-tar SPRINGBOOT_WEBAPP_IMGREPO=nebroad/demo
/usr/bin/docker save -o "nebroad_demo.tar" nebroad/demo
```

```
$ make tar-to-image 
```

### Volume mount whith Docker run

For example
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker run -d -P --env TARGET_ARCHIVE=webapp.war --mount type=bind,source=$(pwd)/test.war,target=/springboot/webapp.war --name=sbwebapptest nebroad/test
bb4da9183808a7cf3f301861cbdc6a4c3f28d8ca7960fe07c2ae27dbff341459
```
