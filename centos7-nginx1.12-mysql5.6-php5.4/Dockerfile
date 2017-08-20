# Inspired by https://github.com/doig-u/docker-lemp
FROM centos:7
LABEL maintainer="tangfeixiong <tangfx128@gmail.com>" \
      project="stackdocker" \
      repository="containerops/centos7-nginx1.12-mysql5.6-php5.4" \
      tag="nginx php"

RUN set -e \

# Install
    && yum install -y epel-release \
    && echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/$releasever/$basearch/\ngpgcheck=0\nenabled=1' > /etc/yum.repos.d/nginx.repo \
    # curl -jkSL https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm -O 
    # rpm -ivh mysql57-community-release-el7-9.noarch.rpm 
    # rm -f mysql57-community-release-el7-9.noarch.rpm 
    # yum install -y http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
# install "pwgen" for randomizing passwords
    && install_PKGs=" \
        ca-certificates \
        nginx \
        # mysql-community-server 
        # pwgen
        php-cli \
        php-fpm \
        php-mysql \
        php-gd \
        php-mcrypt \
        supervisor \
     " \
    && yum install -y $install_PKGs \
    && rpm -V $install_PKGs \
    && yum clean all \

# Nginx
    && mkdir -p /var/log/nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log \
    # mv /etc/nginx/sites-available/default /etc/nginx/conf.d/default.conf 
    # rm -rf /etc/nginx/sites-available /etc/nginx/sites-enable 

# PHP
    && mkdir -p /var/log/php/ /run/php /run/php-fpm \
    && ln -sf /dev/stderr /var/log/php/error.log \
    && ln -sf /dev/stderr /var/log/php-fpm/error.log \

# Supervisor
    && mkdir -p /var/log/supervisor

# User
    # useradd -r -d /usr/share/nginx/html -G nginx www-data 
    # chgrp -R www-data /usr/share/nginx/html 
    # chmod -R g+w /usr/share/nginx/html
    # chmod g+s /usr/share/nginx/html

COPY ./etc/ /tmp/etc/
### COPY ./etc/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
### COPY ./etc/nginx/nginx.conf /etc/nginx/
### COPY ./etc/php/php.ini ./etc/php/php-fpm.conf /etc/php/7.0/fpm/
### COPY ./etc/php/www.conf /etc/php/7.0/fpm/pool.d/
RUN mkdir -p /etc/nginx/conf.d \
    && mkdir -p /etc/php-fpm.d \
    && mkdir -p /etc/supervisor/conf.d \
    && cp -f /tmp/etc/nginx/nginx1.12.conf /etc/nginx/ \
    && cp -f /tmp/etc/nginx/default1.12.conf /etc/nginx/conf.d/default.conf \
    && cp -f /tmp/etc/php/php5.4.ini /etc/php.ini \
    && cp -f /tmp/etc/php/php-fpm5.4.conf /etc/php-fpm.conf \
    && cp -f /tmp/etc/php/www5.4.conf /etc/php-fpm.d/www.conf \
    && cp -f /tmp/etc/supervisor/supervisord-php5.4.conf /etc/supervisor/conf.d/supervisord.conf \
    && rm -rf /tmp/etc

COPY ./src/app/ /usr/share/nginx/html/

# Common
EXPOSE 80 443

VOLUME ["/var/log/supervisor"]

CMD ["/usr/bin/supervisord", "--configuration=/etc/supervisor/conf.d/supervisord.conf", "--logfile=/var/log/supervisor/supervisord.log"]