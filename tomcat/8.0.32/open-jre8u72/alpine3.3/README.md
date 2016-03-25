Usage
-----

    ./build-docker-image.sh repo[:tag] war [[base-image-tar] tomcat-archive]

Example
------

    ./build-docker-image.sh tangfeixiong/tomcat-sample ~/Download/sample.war ~/Download/apache-tomcat-8.0.32.tar.gz

or

    ./build-docker-image.sh quay.io/tangfeixiong/tomcat-sample ~/Download/sample.war ~/ImageArchive/java.8u72-jre-alpine.tar ~/Download/apache-tomcat-8.0.32.tar.gz
