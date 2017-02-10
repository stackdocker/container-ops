FROM ubuntu:14.04
MAINTAINER tangfeixiong <tangfx128@gmail.com>

ADD /mirror-k8s-required-repo.sh /run.sh

RUN /run.sh \
    && apt-get --no-install-recommends --no-install-suggests -y install nginx \
    && for i in $(ls /usr/share/nginx/html); do \
        [ -f /usr/share/nginx/html/$i ] \
        && [[ "$i" =~ html? ]] \
        && mv /usr/share/nginx/html/$i /usr/share/nginx/html/nginx-$i ; \
    done \
    && ln -s /var/spool/apt-mirror/mirror /usr/share/nginx/html/ubuntu-$(cat /etc/os-release | grep 'VERSION=' | cut -d' ' -f3 | tr '[:upper:]' '[:lower:]') \
    && mkdir -p /usr/share/nginx/html/ubuntu/$(cat /etc/os-release | grep 'VERSION_ID=' | cut -d= -f2 | tr -d \")

VOLUME /usr/share/nginx/html/ubuntu/14.04 /usr/share/nginx/html/ubuntu/16.04 

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]