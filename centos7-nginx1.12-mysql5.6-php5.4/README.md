## Instruction

### Nginx 1.12 + PHP5.4

Build
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker build --no-cache --force-rm -t docker.io/tangfeixiong/nginx-php-demo .
Sending build context to Docker daemon   212 kB
Step 1 : FROM centos:7
 ---> 328edcd84f1b
Step 2 : LABEL maintainer "tangfeixiong <tangfx128@gmail.com>" project "stackdocker" repository "containerops/centos7-nginx1.12-mysql5.6-php5.4" tag "nginx php"
 ---> Running in fa7b27576576
 ---> ec50968f8c81
Removing intermediate container fa7b27576576
Step 3 : RUN set -e     && yum install -y epel-release     && echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/$releasever/$basearch/\ngpgcheck=0\nenabled=1' > /etc/yum.repos.d/nginx.repo     && install_PKGs="         ca-certificates         nginx         php-cli         php-fpm         php-mysql         php-gd         php-mcrypt         supervisor      "     && yum install -y $install_PKGs     && rpm -V $install_PKGs     && yum clean all     && mkdir -p /var/log/nginx     && ln -sf /dev/stdout /var/log/nginx/access.log 	&& ln -sf /dev/stderr /var/log/nginx/error.log     && mkdir -p /var/log/php/ /run/php /run/php-fpm     && ln -sf /dev/stderr /var/log/php/error.log     && ln -sf /dev/stderr /var/log/php-fpm/error.log     && mkdir -p /var/log/supervisor
 ---> Running in 0d9f3b99138a
Loaded plugins: fastestmirror, ovl
http://mirrors.nju.edu.cn/centos/7.3.1611/os/x86_64/repodata/bd50ff3d861cc21d254a390a963e9f0fd7b7b96ed9d31ece2f2b1997aa3a056f-primary.sqlite.bz2: [Errno 12] Timeout on http://mirrors.nju.edu.cn/centos/7.3.1611/os/x86_64/repodata/bd50ff3d861cc21d254a390a963e9f0fd7b7b96ed9d31ece2f2b1997aa3a056f-primary.sqlite.bz2: (28, 'Operation too slow. Less than 1000 bytes/sec transferred the last 30 seconds')
Trying other mirror.
Determining fastest mirrors
 * base: mirrors.yun-idc.com
 * extras: mirrors.cn99.com
 * updates: mirrors.btte.net
Resolving Dependencies
--> Running transaction check
---> Package epel-release.noarch 0:7-9 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                Arch             Version         Repository        Size
================================================================================
Installing:
 epel-release           noarch           7-9             extras            14 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 14 k
Installed size: 24 k
Downloading packages:
warning: /var/cache/yum/x86_64/7/extras/packages/epel-release-7-9.noarch.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for epel-release-7-9.noarch.rpm is not installed
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-3.1611.el7.centos.x86_64 (@CentOS)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : epel-release-7-9.noarch                                      1/1 
  Verifying  : epel-release-7-9.noarch                                      1/1 

Installed:
  epel-release.noarch 0:7-9                                                     

Complete!
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: mirrors.yun-idc.com
 * epel: mirrors.tuna.tsinghua.edu.cn
 * extras: mirrors.cn99.com
 * updates: mirrors.btte.net
Package ca-certificates-2017.2.14-70.1.el7_3.noarch already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package nginx.x86_64 1:1.12.1-1.el7.ngx will be installed
--> Processing Dependency: openssl >= 1.0.1 for package: 1:nginx-1.12.1-1.el7.ngx.x86_64
---> Package php-cli.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: php-common(x86-64) = 5.4.16-42.el7 for package: php-cli-5.4.16-42.el7.x86_64
--> Processing Dependency: libedit.so.0()(64bit) for package: php-cli-5.4.16-42.el7.x86_64
---> Package php-fpm.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: systemd-sysv for package: php-fpm-5.4.16-42.el7.x86_64
---> Package php-gd.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: libpng15.so.15(PNG15_0)(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libjpeg.so.62(LIBJPEG_6.2)(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libt1.so.5()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libpng15.so.15()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libjpeg.so.62()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libfreetype.so.6()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libXpm.so.4()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libX11.so.6()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
---> Package php-mcrypt.x86_64 0:5.4.16-7.el7 will be installed
--> Processing Dependency: libmcrypt.so.4()(64bit) for package: php-mcrypt-5.4.16-7.el7.x86_64
---> Package php-mysql.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: php-pdo(x86-64) = 5.4.16-42.el7 for package: php-mysql-5.4.16-42.el7.x86_64
--> Processing Dependency: libmysqlclient.so.18(libmysqlclient_18)(64bit) for package: php-mysql-5.4.16-42.el7.x86_64
--> Processing Dependency: libmysqlclient.so.18()(64bit) for package: php-mysql-5.4.16-42.el7.x86_64
---> Package supervisor.noarch 0:3.1.3-3.el7 will be installed
--> Processing Dependency: python-meld3 >= 0.6.5 for package: supervisor-3.1.3-3.el7.noarch
--> Processing Dependency: python-setuptools for package: supervisor-3.1.3-3.el7.noarch
--> Running transaction check
---> Package freetype.x86_64 0:2.4.11-12.el7 will be installed
---> Package libX11.x86_64 0:1.6.3-3.el7 will be installed
--> Processing Dependency: libX11-common >= 1.6.3-3.el7 for package: libX11-1.6.3-3.el7.x86_64
--> Processing Dependency: libxcb.so.1()(64bit) for package: libX11-1.6.3-3.el7.x86_64
---> Package libXpm.x86_64 0:3.5.11-3.el7 will be installed
---> Package libedit.x86_64 0:3.0-12.20121213cvs.el7 will be installed
---> Package libjpeg-turbo.x86_64 0:1.2.90-5.el7 will be installed
---> Package libmcrypt.x86_64 0:2.5.8-13.el7 will be installed
---> Package libpng.x86_64 2:1.5.13-7.el7_2 will be installed
---> Package mariadb-libs.x86_64 1:5.5.52-1.el7 will be installed
---> Package openssl.x86_64 1:1.0.1e-60.el7_3.1 will be installed
--> Processing Dependency: make for package: 1:openssl-1.0.1e-60.el7_3.1.x86_64
---> Package php-common.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: libzip.so.2()(64bit) for package: php-common-5.4.16-42.el7.x86_64
---> Package php-pdo.x86_64 0:5.4.16-42.el7 will be installed
---> Package python-meld3.x86_64 0:0.6.10-1.el7 will be installed
---> Package python-setuptools.noarch 0:0.9.8-4.el7 will be installed
--> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-4.el7.noarch
---> Package systemd-sysv.x86_64 0:219-30.el7_3.9 will be installed
---> Package t1lib.x86_64 0:5.1.2-14.el7 will be installed
--> Running transaction check
---> Package libX11-common.noarch 0:1.6.3-3.el7 will be installed
---> Package libxcb.x86_64 0:1.11-4.el7 will be installed
--> Processing Dependency: libXau.so.6()(64bit) for package: libxcb-1.11-4.el7.x86_64
---> Package libzip.x86_64 0:0.10.1-8.el7 will be installed
---> Package make.x86_64 1:3.82-23.el7 will be installed
---> Package python-backports-ssl_match_hostname.noarch 0:3.4.0.2-4.el7 will be installed
--> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch
--> Running transaction check
---> Package libXau.x86_64 0:1.0.8-2.1.el7 will be installed
---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                            Arch   Version                Repository
                                                                           Size
================================================================================
Installing:
 nginx                              x86_64 1:1.12.1-1.el7.ngx     nginx   716 k
 php-cli                            x86_64 5.4.16-42.el7          base    2.7 M
 php-fpm                            x86_64 5.4.16-42.el7          base    1.4 M
 php-gd                             x86_64 5.4.16-42.el7          base    127 k
 php-mcrypt                         x86_64 5.4.16-7.el7           epel     20 k
 php-mysql                          x86_64 5.4.16-42.el7          base    101 k
 supervisor                         noarch 3.1.3-3.el7            epel    445 k
Installing for dependencies:
 freetype                           x86_64 2.4.11-12.el7          base    391 k
 libX11                             x86_64 1.6.3-3.el7            base    606 k
 libX11-common                      noarch 1.6.3-3.el7            base    162 k
 libXau                             x86_64 1.0.8-2.1.el7          base     29 k
 libXpm                             x86_64 3.5.11-3.el7           base     54 k
 libedit                            x86_64 3.0-12.20121213cvs.el7 base     92 k
 libjpeg-turbo                      x86_64 1.2.90-5.el7           base    134 k
 libmcrypt                          x86_64 2.5.8-13.el7           epel     99 k
 libpng                             x86_64 2:1.5.13-7.el7_2       base    213 k
 libxcb                             x86_64 1.11-4.el7             base    189 k
 libzip                             x86_64 0.10.1-8.el7           base     48 k
 make                               x86_64 1:3.82-23.el7          base    420 k
 mariadb-libs                       x86_64 1:5.5.52-1.el7         base    761 k
 openssl                            x86_64 1:1.0.1e-60.el7_3.1    updates 713 k
 php-common                         x86_64 5.4.16-42.el7          base    564 k
 php-pdo                            x86_64 5.4.16-42.el7          base     98 k
 python-backports                   x86_64 1.0-8.el7              base    5.8 k
 python-backports-ssl_match_hostname
                                    noarch 3.4.0.2-4.el7          base     12 k
 python-meld3                       x86_64 0.6.10-1.el7           epel     73 k
 python-setuptools                  noarch 0.9.8-4.el7            base    396 k
 systemd-sysv                       x86_64 219-30.el7_3.9         updates  64 k
 t1lib                              x86_64 5.1.2-14.el7           base    166 k

Transaction Summary
================================================================================
Install  7 Packages (+22 Dependent packages)

Total download size: 11 M
Installed size: 38 M
Downloading packages:
warning: /var/cache/yum/x86_64/7/epel/packages/libmcrypt-2.5.8-13.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 352c64e5: NOKEY
Public key for libmcrypt-2.5.8-13.el7.x86_64.rpm is not installed
--------------------------------------------------------------------------------
Total                                              1.1 MB/s |  11 MB  00:09     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Importing GPG key 0x352C64E5:
 Userid     : "Fedora EPEL (7) <epel@fedoraproject.org>"
 Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5
 Package    : epel-release-7-9.noarch (@extras)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libX11-common-1.6.3-3.el7.noarch                            1/29 
  Installing : libedit-3.0-12.20121213cvs.el7.x86_64                       2/29 
  Installing : libXau-1.0.8-2.1.el7.x86_64                                 3/29 
  Installing : libxcb-1.11-4.el7.x86_64                                    4/29 
  Installing : libX11-1.6.3-3.el7.x86_64                                   5/29 
  Installing : t1lib-5.1.2-14.el7.x86_64                                   6/29 
  Installing : libXpm-3.5.11-3.el7.x86_64                                  7/29 
  Installing : freetype-2.4.11-12.el7.x86_64                               8/29 
  Installing : systemd-sysv-219-30.el7_3.9.x86_64                          9/29 
  Installing : 1:make-3.82-23.el7.x86_64                                  10/29 
  Installing : 1:openssl-1.0.1e-60.el7_3.1.x86_64                         11/29 
  Installing : 1:mariadb-libs-5.5.52-1.el7.x86_64                         12/29 
  Installing : python-backports-1.0-8.el7.x86_64                          13/29 
  Installing : python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch   14/29 
  Installing : python-setuptools-0.9.8-4.el7.noarch                       15/29 
  Installing : libzip-0.10.1-8.el7.x86_64                                 16/29 
  Installing : php-common-5.4.16-42.el7.x86_64                            17/29 
  Installing : php-pdo-5.4.16-42.el7.x86_64                               18/29 
  Installing : python-meld3-0.6.10-1.el7.x86_64                           19/29 
  Installing : libmcrypt-2.5.8-13.el7.x86_64                              20/29 
  Installing : 2:libpng-1.5.13-7.el7_2.x86_64                             21/29 
  Installing : libjpeg-turbo-1.2.90-5.el7.x86_64                          22/29 
  Installing : php-gd-5.4.16-42.el7.x86_64                                23/29 
  Installing : php-mcrypt-5.4.16-7.el7.x86_64                             24/29 
  Installing : supervisor-3.1.3-3.el7.noarch                              25/29 
  Installing : php-mysql-5.4.16-42.el7.x86_64                             26/29 
  Installing : php-cli-5.4.16-42.el7.x86_64                               27/29 
  Installing : php-fpm-5.4.16-42.el7.x86_64                               28/29 
  Installing : 1:nginx-1.12.1-1.el7.ngx.x86_64                            29/29 
----------------------------------------------------------------------

Thanks for using nginx!

Please find the official documentation for nginx here:
* http://nginx.org/en/docs/

Please subscribe to nginx-announce mailing list to get
the most important news about nginx:
* http://nginx.org/en/support.html

Commercial subscriptions for nginx are available on:
* http://nginx.com/products/

----------------------------------------------------------------------
  Verifying  : 1:nginx-1.12.1-1.el7.ngx.x86_64                             1/29 
  Verifying  : 1:openssl-1.0.1e-60.el7_3.1.x86_64                          2/29 
  Verifying  : python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch    3/29 
  Verifying  : php-cli-5.4.16-42.el7.x86_64                                4/29 
  Verifying  : libjpeg-turbo-1.2.90-5.el7.x86_64                           5/29 
  Verifying  : php-mysql-5.4.16-42.el7.x86_64                              6/29 
  Verifying  : libxcb-1.11-4.el7.x86_64                                    7/29 
  Verifying  : 2:libpng-1.5.13-7.el7_2.x86_64                              8/29 
  Verifying  : libmcrypt-2.5.8-13.el7.x86_64                               9/29 
  Verifying  : php-common-5.4.16-42.el7.x86_64                            10/29 
  Verifying  : php-fpm-5.4.16-42.el7.x86_64                               11/29 
  Verifying  : python-setuptools-0.9.8-4.el7.noarch                       12/29 
  Verifying  : php-gd-5.4.16-42.el7.x86_64                                13/29 
  Verifying  : python-meld3-0.6.10-1.el7.x86_64                           14/29 
  Verifying  : libzip-0.10.1-8.el7.x86_64                                 15/29 
  Verifying  : t1lib-5.1.2-14.el7.x86_64                                  16/29 
  Verifying  : python-backports-1.0-8.el7.x86_64                          17/29 
  Verifying  : libXpm-3.5.11-3.el7.x86_64                                 18/29 
  Verifying  : 1:mariadb-libs-5.5.52-1.el7.x86_64                         19/29 
  Verifying  : 1:make-3.82-23.el7.x86_64                                  20/29 
  Verifying  : supervisor-3.1.3-3.el7.noarch                              21/29 
  Verifying  : php-pdo-5.4.16-42.el7.x86_64                               22/29 
  Verifying  : systemd-sysv-219-30.el7_3.9.x86_64                         23/29 
  Verifying  : freetype-2.4.11-12.el7.x86_64                              24/29 
  Verifying  : libXau-1.0.8-2.1.el7.x86_64                                25/29 
  Verifying  : php-mcrypt-5.4.16-7.el7.x86_64                             26/29 
  Verifying  : libedit-3.0-12.20121213cvs.el7.x86_64                      27/29 
  Verifying  : libX11-1.6.3-3.el7.x86_64                                  28/29 
  Verifying  : libX11-common-1.6.3-3.el7.noarch                           29/29 

Installed:
  nginx.x86_64 1:1.12.1-1.el7.ngx        php-cli.x86_64 0:5.4.16-42.el7        
  php-fpm.x86_64 0:5.4.16-42.el7         php-gd.x86_64 0:5.4.16-42.el7         
  php-mcrypt.x86_64 0:5.4.16-7.el7       php-mysql.x86_64 0:5.4.16-42.el7      
  supervisor.noarch 0:3.1.3-3.el7       

Dependency Installed:
  freetype.x86_64 0:2.4.11-12.el7                                               
  libX11.x86_64 0:1.6.3-3.el7                                                   
  libX11-common.noarch 0:1.6.3-3.el7                                            
  libXau.x86_64 0:1.0.8-2.1.el7                                                 
  libXpm.x86_64 0:3.5.11-3.el7                                                  
  libedit.x86_64 0:3.0-12.20121213cvs.el7                                       
  libjpeg-turbo.x86_64 0:1.2.90-5.el7                                           
  libmcrypt.x86_64 0:2.5.8-13.el7                                               
  libpng.x86_64 2:1.5.13-7.el7_2                                                
  libxcb.x86_64 0:1.11-4.el7                                                    
  libzip.x86_64 0:0.10.1-8.el7                                                  
  make.x86_64 1:3.82-23.el7                                                     
  mariadb-libs.x86_64 1:5.5.52-1.el7                                            
  openssl.x86_64 1:1.0.1e-60.el7_3.1                                            
  php-common.x86_64 0:5.4.16-42.el7                                             
  php-pdo.x86_64 0:5.4.16-42.el7                                                
  python-backports.x86_64 0:1.0-8.el7                                           
  python-backports-ssl_match_hostname.noarch 0:3.4.0.2-4.el7                    
  python-meld3.x86_64 0:0.6.10-1.el7                                            
  python-setuptools.noarch 0:0.9.8-4.el7                                        
  systemd-sysv.x86_64 0:219-30.el7_3.9                                          
  t1lib.x86_64 0:5.1.2-14.el7                                                   

Complete!
Loaded plugins: fastestmirror, ovl
Cleaning repos: base epel extras nginx updates
Cleaning up everything
Cleaning up list of fastest mirrors
 ---> ccdf251827af
Removing intermediate container 0d9f3b99138a
Step 4 : COPY ./etc/ /tmp/etc/
 ---> 11b262304d9a
Removing intermediate container ca65165de693
Step 5 : RUN mkdir -p /etc/nginx/conf.d     && mkdir -p /etc/php-fpm.d     && mkdir -p /etc/supervisor/conf.d     && cp -f /tmp/etc/nginx/nginx1.12.conf /etc/nginx/     && cp -f /tmp/etc/nginx/default1.12.conf /etc/nginx/conf.d/default.conf     && cp -f /tmp/etc/php/php5.4.ini /etc/php.ini     && cp -f /tmp/etc/php/php-fpm5.4.conf /etc/php-fpm.conf     && cp -f /tmp/etc/php/www5.4.conf /etc/php-fpm.d/www.conf     && cp -f /tmp/etc/supervisor/supervisord-php5.4.conf /etc/supervisor/conf.d/supervisord.conf     && rm -rf /tmp/etc
 ---> Running in f4a81c6dfbc7
 ---> 25b6ba9f0b48
Removing intermediate container f4a81c6dfbc7
Step 6 : COPY ./src/app/ /usr/share/nginx/html/
 ---> ceece858fcac
Removing intermediate container 3134bd209e62
Step 7 : EXPOSE 80 443
 ---> Running in ad30f1ec4b45
 ---> a61245197bf7
Removing intermediate container ad30f1ec4b45
Step 8 : VOLUME /var/log/supervisor
 ---> Running in c9a7f567b554
 ---> 63703af4564f
Removing intermediate container c9a7f567b554
Step 9 : CMD /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/supervisord.conf --logfile=/var/log/supervisor/supervisord.log
 ---> Running in 8bd6fb5627f6
 ---> 95741ad6f280
Removing intermediate container 8bd6fb5627f6
Successfully built 95741ad6f280
```

Test
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ mkdir -p /tmp/tmplog
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker run -d -v /tmp/tmplog:/var/log/supervisor -p 8999:80 --name=demo tangfeixiong/nginx-php-demo
5f9a4418913d7c2263abedcc45c3b07d7a678587e5628675bbc10371064f2254
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker logs demo
2017-08-20 08:35:26,672 CRIT Supervisor running as root (no user in config file)
2017-08-20 08:35:26,687 INFO supervisord started with pid 1
2017-08-20 08:35:27,692 INFO spawned: 'nginx' with pid 9
2017-08-20 08:35:27,694 INFO spawned: 'php-fpm' with pid 10
2017-08-20 08:35:28,906 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2017-08-20 08:35:28,906 INFO success: php-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

Logs
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ cat /tmp/tmplog/supervisord.log 
2017-08-20 08:35:26,672 CRIT Supervisor running as root (no user in config file)
2017-08-20 08:35:26,687 INFO supervisord started with pid 1
2017-08-20 08:35:27,692 INFO spawned: 'nginx' with pid 9
2017-08-20 08:35:27,694 INFO spawned: 'php-fpm' with pid 10
2017-08-20 08:35:28,906 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2017-08-20 08:35:28,906 INFO success: php-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

Process
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker exec -ti demo ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 08:35 ?        00:00:00 /usr/bin/python /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/supervisord.conf 
root         9     1  0 08:35 ?        00:00:00 nginx: master process nginx -g daemon off;
root        10     1  0 08:35 ?        00:00:00 php-fpm: master process (/etc/php-fpm.conf)
nginx       11     9  0 08:35 ?        00:00:00 nginx: worker process
nginx       13    10  0 08:35 ?        00:00:00 php-fpm: pool www
nginx       14    10  0 08:35 ?        00:00:00 php-fpm: pool www
nginx       15    10  0 08:35 ?        00:00:00 php-fpm: pool www
nginx       16    10  0 08:35 ?        00:00:00 php-fpm: pool www
nginx       17    10  0 08:35 ?        00:00:00 php-fpm: pool www
root        35     0  0 08:45 ?        00:00:00 ps -ef
```

Host
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ sudo systemctl list-units --type=service --state=running
UNIT                     LOAD   ACTIVE SUB     DESCRIPTION
atd.service              loaded active running Job spooling tools
auditd.service           loaded active running Security Auditing Service
crond.service            loaded active running Command Scheduler
dbus.service             loaded active running D-Bus System Message Bus
docker.service           loaded active running Docker Application Container Engine
getty@tty1.service       loaded active running Getty on tty1
gssproxy.service         loaded active running GSSAPI Proxy Daemon
lvm2-lvmetad.service     loaded active running LVM2 metadata daemon
NetworkManager.service   loaded active running Network Manager
polkit.service           loaded active running Authorization Manager
sshd.service             loaded active running OpenSSH server daemon
systemd-journald.service loaded active running Journal Service
systemd-logind.service   loaded active running Login Service
systemd-udevd.service    loaded active running udev Kernel Device Manager
user@1000.service        loaded active running User Manager for UID 1000
vboxadd-service.service  loaded active running vboxadd-service.service

LOAD   = Reflects whether the unit definition was properly loaded.
ACTIVE = The high-level unit activation state, i.e. generalization of SUB.
SUB    = The low-level unit activation state, values depend on unit type.

16 loaded units listed. Pass --all to see loaded but inactive units, too.
To show all installed unit files use 'systemctl list-unit-files'.
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 8月08 ?       00:00:26 /usr/lib/systemd/systemd --switched-root --system --deserialize 20
root         2     0  0 8月08 ?       00:00:00 [kthreadd]
root         3     2  0 8月08 ?       00:00:57 [ksoftirqd/0]
root         7     2  0 8月08 ?       00:09:01 [rcu_sched]
root         8     2  0 8月08 ?       00:00:00 [rcu_bh]
root         9     2  0 8月08 ?       00:01:26 [rcuos/0]
root        10     2  0 8月08 ?       00:00:00 [rcuob/0]
root        11     2  0 8月08 ?       00:00:01 [migration/0]
root        12     2  0 8月08 ?       00:01:04 [watchdog/0]
root        13     2  0 8月08 ?       00:00:41 [watchdog/1]
root        14     2  0 8月08 ?       00:00:01 [migration/1]
root        15     2  0 8月08 ?       00:00:17 [ksoftirqd/1]
root        18     2  0 8月08 ?       00:01:18 [rcuos/1]
root        19     2  0 8月08 ?       00:00:00 [rcuob/1]
root        20     2  0 8月08 ?       00:00:00 [khelper]
root        21     2  0 8月08 ?       00:00:00 [kdevtmpfs]
root        22     2  0 8月08 ?       00:00:00 [netns]
root        23     2  0 8月08 ?       00:00:00 [perf]
root        24     2  0 8月08 ?       00:00:00 [writeback]
root        25     2  0 8月08 ?       00:00:00 [ksmd]
root        26     2  0 8月08 ?       00:00:10 [khugepaged]
root        27     2  0 8月08 ?       00:00:00 [crypto]
root        28     2  0 8月08 ?       00:00:00 [kintegrityd]
root        29     2  0 8月08 ?       00:00:00 [bioset]
root        30     2  0 8月08 ?       00:00:00 [kblockd]
root        31     2  0 8月08 ?       00:00:00 [ata_sff]
root        32     2  0 8月08 ?       00:00:00 [md]
root        33     2  0 8月08 ?       00:00:00 [devfreq_wq]
root        36     2  0 8月08 ?       00:00:04 [kswapd0]
root        37     2  0 8月08 ?       00:00:00 [fsnotify_mark]
root        80     2  0 8月08 ?       00:00:00 [kthrotld]
root        81     2  0 8月08 ?       00:00:00 [acpi_thermal_pm]
root        83     2  0 8月08 ?       00:00:00 [scsi_eh_0]
root        84     2  0 8月08 ?       00:00:00 [scsi_tmf_0]
root        85     2  0 8月08 ?       00:00:00 [scsi_eh_1]
root        86     2  0 8月08 ?       00:00:00 [scsi_tmf_1]
root        88     2  0 8月08 ?       00:00:00 [scsi_eh_2]
root        89     2  0 8月08 ?       00:00:00 [scsi_tmf_2]
root        90     2  0 8月08 ?       00:00:00 [scsi_eh_3]
root        91     2  0 8月08 ?       00:00:00 [scsi_tmf_3]
root        94     2  0 8月08 ?       00:00:00 [kpsmoused]
root        96     2  0 8月08 ?       00:00:00 [dm_bufio_cache]
root        97     2  0 8月08 ?       00:00:00 [ipv6_addrconf]
root       137     2  0 8月08 ?       00:00:00 [deferwq]
root       184     2  0 8月08 ?       00:00:00 [kauditd]
root       371     2  0 8月08 ?       00:00:00 [kdmflush]
root       372     2  0 8月08 ?       00:00:00 [bioset]
root       379     2  0 8月08 ?       00:00:00 [kdmflush]
root       381     2  0 8月08 ?       00:00:00 [bioset]
root       401     2  0 8月08 ?       00:00:24 [jbd2/dm-0-8]
root       402     2  0 8月08 ?       00:00:00 [ext4-rsv-conver]
root       464     1  0 8月08 ?       00:00:35 /usr/lib/systemd/systemd-journald
root       488     2  0 8月08 ?       00:00:00 [rpciod]
root       500     1  0 8月08 ?       00:00:00 /usr/sbin/lvmetad -f
root       509     1  0 8月08 ?       00:00:07 /usr/lib/systemd/systemd-udevd
root       556     2  0 8月08 ?       00:00:00 [iprt-VBoxWQueue]
root       594     2  0 8月08 ?       00:00:00 [jbd2/sda1-8]
root       595     2  0 8月08 ?       00:00:00 [ext4-rsv-conver]
root       596     2  0 8月08 ?       00:00:00 [kdmflush]
root       597     2  0 8月08 ?       00:00:00 [bioset]
root       598     2  0 8月08 ?       00:00:00 [kdmflush]
root       599     2  0 8月08 ?       00:00:00 [bioset]
root       617     1  0 8月08 ?       00:00:03 /sbin/auditd -n
root       632     1  0 8月08 ?       00:00:04 /usr/lib/systemd/systemd-logind
root       633     1  0 8月08 ?       00:00:09 /usr/sbin/NetworkManager --no-daemon
root       635     1  0 8月08 ?       00:00:04 /usr/sbin/gssproxy -D
dbus       639     1  0 8月08 ?       00:00:54 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root       702     1  0 8月08 ?       00:00:04 /usr/sbin/crond -n
root       703     1  0 8月08 tty1    00:00:00 /sbin/agetty --noclear tty1 linux
root       704     1  0 8月08 ?       00:00:00 /usr/sbin/sshd
root       705     1  0 8月08 ?       00:00:00 /usr/sbin/atd -f
polkitd    710     1  0 8月08 ?       00:00:00 /usr/lib/polkit-1/polkitd --no-debug
root       742     2  0 8月08 ?       00:00:00 [kdmflush]
root       755     2  0 8月08 ?       00:00:00 [bioset]
root       756     2  0 8月08 ?       00:00:00 [kcopyd]
root       757     2  0 8月08 ?       00:00:00 [bioset]
root       758     2  0 8月08 ?       00:00:00 [dm-thin]
root       759     2  0 8月08 ?       00:00:00 [bioset]
root       795     1  0 8月08 ?       00:09:59 /usr/sbin/VBoxService --pidfile /var/lock/subsys/vboxadd-service
102       2169 24194  0 8月10 ?       00:00:00 postgres: gitlab gitlabhq_production 172.18.0.4(39478) idle
102       2173 24194  0 8月10 ?       00:00:00 postgres: gitlab gitlabhq_production 172.18.0.4(39480) idle
root      2246     2  0 8月08 ?       00:00:00 [xfsalloc]
root      2247     2  0 8月08 ?       00:00:00 [xfs_mru_cache]
root      2404 23800  0 8月11 ?       00:01:39 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8081 -container-ip 172.17.0.4 -container-
root      2459 23800  0 8月11 ?       01:28:04 /opt/java/bin/java -Dnexus-work=/sonatype-work -Dnexus-webapp-context-path=/ -Xms256m -Xmx768
root      3451     2  0 8月11 ?       00:00:00 [kdmflush]
root      3454     2  0 8月11 ?       00:00:00 [bioset]
root      3458     2  0 8月11 ?       00:00:00 [xfs-buf/dm-14]
root      3459     2  0 8月11 ?       00:00:00 [xfs-data/dm-14]
root      3460     2  0 8月11 ?       00:00:00 [xfs-conv/dm-14]
root      3461     2  0 8月11 ?       00:00:00 [xfs-cil/dm-14]
root      3462     2  0 8月11 ?       00:00:00 [xfsaild/dm-14]
root      3477 23800  0 8月11 ?       00:01:38 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 6080 -container-ip 172.17.0.8 -container-
root      3508 23800  0 8月11 pts/1   00:00:55 /bin/tini -- /usr/bin/supervisord -n
root      3529  3508  0 8月11 pts/1   00:00:00 /bin/bash /startup.sh
root      3531  3529  0 8月11 pts/1   00:05:42 python ./run.py
root      3532  3508  0 8月11 ?       00:00:00 nginx: master process nginx -c /etc/nginx/nginx.conf
33        3533  3532  0 8月11 ?       00:02:25 nginx: worker process
33        3534  3532  0 8月11 ?       00:02:12 nginx: worker process
root      3535  3508  0 8月11 pts/1   00:05:58 /usr/bin/python /usr/bin/supervisord -n
root      3542  3535  0 8月11 pts/1   00:02:03 /usr/bin/Xvfb :1 -screen 0 1024x768x16
root      3543  3535  0 8月11 pts/1   00:00:03 /usr/bin/pcmanfm --desktop --profile LXDE
root      3544  3535  0 8月11 pts/1   00:06:14 /usr/bin/lxpanel --profile LXDE
root      3545  3535  0 8月11 pts/1   00:00:02 /usr/bin/openbox
root      3546  3535  0 8月11 pts/1   00:30:54 x11vnc -display :1 -xkb -forever -shared
root      3547  3535  0 8月11 pts/1   00:03:26 python /usr/lib/noVNC/utils/websockify/run --web /usr/lib/noVNC 6081 localhost:5900
root      3567  3508  0 8月11 ?       00:00:00 /usr/lib/menu-cache/menu-cached /tmp/.menu-cached-:1-root
root      3950  3544  0 8月11 pts/1   00:00:04 lxterminal
root      3951  3950  0 8月11 pts/1   00:00:00 gnome-pty-helper
root      3952  3950  0 8月11 pts/0   00:00:00 /bin/bash
root      6203     2  0 8月17 ?       00:00:08 [kworker/1:0H]
root      7583     2  0 07:11 ?        00:00:00 [kworker/1:2H]
root     10278   704  0 8月17 ?       00:00:00 sshd: vagrant [priv]
vagrant  10282     1  0 8月17 ?       00:00:00 /usr/lib/systemd/systemd --user
vagrant  10284 10282  0 8月17 ?       00:00:00 (sd-pam)
vagrant  10287 10278  0 8月17 ?       00:00:05 sshd: vagrant@pts/0
vagrant  10288 10287  0 8月17 pts/0   00:00:01 -bash
root     14262     2  0 08:28 ?        00:00:03 [kworker/u4:2]
root     14300     2  0 08:28 ?        00:00:00 [kworker/0:1]
root     15531     2  0 08:35 ?        00:00:00 [kdmflush]
root     15534     2  0 08:35 ?        00:00:00 [bioset]
root     15538     2  0 08:35 ?        00:00:00 [xfs-buf/dm-15]
root     15539     2  0 08:35 ?        00:00:00 [xfs-data/dm-15]
root     15540     2  0 08:35 ?        00:00:00 [xfs-conv/dm-15]
root     15541     2  0 08:35 ?        00:00:00 [xfs-cil/dm-15]
root     15542     2  0 08:35 ?        00:00:00 [xfsaild/dm-15]
root     15558 23800  0 08:35 ?        00:00:00 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 8999 -container-ip 172.17.0.9 -container-
root     15589 23800  0 08:35 ?        00:00:00 /usr/bin/python /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/supervisord.conf 
root     15609 15589  0 08:35 ?        00:00:00 nginx: master process nginx -g daemon off;
root     15610 15589  0 08:35 ?        00:00:00 php-fpm: master process (/etc/php-fpm.conf)
systemd+ 15611 15609  0 08:35 ?        00:00:00 nginx: worker process
systemd+ 15613 15610  0 08:35 ?        00:00:00 php-fpm: pool www
systemd+ 15614 15610  0 08:35 ?        00:00:00 php-fpm: pool www
systemd+ 15615 15610  0 08:35 ?        00:00:00 php-fpm: pool www
systemd+ 15616 15610  0 08:35 ?        00:00:00 php-fpm: pool www
systemd+ 15617 15610  0 08:35 ?        00:00:00 php-fpm: pool www
root     15619     2  0 08:35 ?        00:00:00 [kworker/1:2]
root     15634     2  0 08:37 ?        00:00:00 [kworker/0:0H]
root     15671     2  0 08:40 ?        00:00:00 [kworker/0:0]
root     15758     2  0 08:46 ?        00:00:00 [kworker/u4:0]
root     15770     2  0 08:47 ?        00:00:00 [kworker/0:1H]
root     15796     2  0 08:50 ?        00:00:00 [kworker/1:0]
root     15813     2  0 08:52 ?        00:00:00 [kworker/u4:1]
vagrant  15853 10288  0 08:56 pts/0    00:00:00 ps -ef
root     23800     1  0 8月09 ?       00:34:58 /usr/bin/docker daemon --bip=172.17.0.1/22 --insecure-registry=172.30.0.0/16,10.3.0.0/24,10.1
root     23913     2  0 8月09 ?       00:00:00 [kdmflush]
root     23914     2  0 8月09 ?       00:00:00 [bioset]
root     23918     2  0 8月09 ?       00:00:00 [xfs-buf/dm-5]
root     23919     2  0 8月09 ?       00:00:00 [xfs-data/dm-5]
root     23920     2  0 8月09 ?       00:00:00 [xfs-conv/dm-5]
root     23921     2  0 8月09 ?       00:00:00 [xfs-cil/dm-5]
root     23922     2  0 8月09 ?       00:00:00 [xfsaild/dm-5]
root     23923     2  0 8月09 ?       00:00:00 [kdmflush]
root     23929     2  0 8月09 ?       00:00:00 [bioset]
102      23945 23800  1 8月09 ?       02:45:29 /usr/bin/redis-server 0.0.0.0:6379
root     23955     2  0 8月09 ?       00:00:00 [xfs-buf/dm-6]
root     23957     2  0 8月09 ?       00:00:00 [xfs-data/dm-6]
root     23958     2  0 8月09 ?       00:00:00 [xfs-conv/dm-6]
root     23960     2  0 8月09 ?       00:00:00 [xfs-cil/dm-6]
root     23963     2  0 8月09 ?       00:00:00 [xfsaild/dm-6]
root     23989     2  0 8月09 ?       00:00:00 [kdmflush]
root     23992     2  0 8月09 ?       00:00:00 [bioset]
root     24011 23800  0 8月09 ?       00:01:55 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 5000 -container-ip 172.17.0.2 -container-
root     24019     2  0 8月09 ?       00:00:00 [xfs-buf/dm-7]
root     24021     2  0 8月09 ?       00:00:00 [xfs-data/dm-7]
root     24022     2  0 8月09 ?       00:00:00 [xfs-conv/dm-7]
root     24023     2  0 8月09 ?       00:00:00 [xfs-cil/dm-7]
root     24024     2  0 8月09 ?       00:00:00 [xfsaild/dm-7]
root     24069 23800  0 8月09 ?       00:03:26 registry serve /etc/docker/registry/config.yml
root     24082     2  0 8月09 ?       00:00:00 [kdmflush]
root     24086     2  0 8月09 ?       00:00:00 [bioset]
root     24111     2  0 8月09 ?       00:00:00 [xfs-buf/dm-8]
root     24113     2  0 8月09 ?       00:00:00 [xfs-data/dm-8]
root     24114     2  0 8月09 ?       00:00:00 [xfs-conv/dm-8]
root     24115     2  0 8月09 ?       00:00:00 [xfs-cil/dm-8]
root     24118 23800  0 8月09 ?       00:01:56 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 5001 -container-ip 172.17.0.3 -container-
root     24129     2  0 8月09 ?       00:00:00 [xfsaild/dm-8]
root     24156 23800  0 8月09 ?       00:08:59 /docker_auth/auth_server --v=2 --alsologtostderr /svc_conf/auth_config.yml
root     24158     2  0 8月09 ?       00:00:00 [kdmflush]
root     24168     2  0 8月09 ?       00:00:00 [bioset]
102      24194 23800  0 8月09 ?       00:00:19 /usr/lib/postgresql/9.6/bin/postgres -D /var/lib/postgresql/9.6/main
root     24216     2  0 8月09 ?       00:00:00 [xfs-buf/dm-9]
root     24218     2  0 8月09 ?       00:00:00 [xfs-data/dm-9]
root     24219     2  0 8月09 ?       00:00:00 [xfs-conv/dm-9]
root     24220     2  0 8月09 ?       00:00:00 [xfs-cil/dm-9]
root     24222     2  0 8月09 ?       00:00:01 [xfsaild/dm-9]
root     24293 23800  0 8月09 ?       00:01:56 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 10080 -container-ip 172.18.0.4 -container
root     24417 23800  0 8月09 ?       00:01:56 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 10022 -container-ip 172.18.0.4 -container
root     24521 23800  0 8月09 ?       00:06:52 /usr/bin/python /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
102      26316 24194  0 8月09 ?       00:00:03 postgres: checkpointer process   
102      26317 24194  0 8月09 ?       00:00:35 postgres: writer process   
102      26318 24194  0 8月09 ?       00:01:29 postgres: wal writer process   
102      26319 24194  0 8月09 ?       00:00:30 postgres: autovacuum launcher process   
102      26320 24194  0 8月09 ?       00:00:52 postgres: stats collector process   
vagrant  26699 24521  0 8月09 ?       00:00:34 unicorn_rails master -c /home/git/gitlab/config/unicorn.rb -E production
vagrant  26700 24521  0 8月09 ?       00:00:37 /usr/local/bin/gitlab-workhorse -listenUmask 0 -listenNetwork tcp -listenAddr :8181 -authBack
root     26701 24521  0 8月09 ?       00:00:03 /usr/sbin/cron -f
root     26702 24521  0 8月09 ?       00:00:00 nginx: master process /usr/sbin/nginx -g daemon off;
root     26703 24521  0 8月09 ?       00:00:00 /usr/sbin/sshd -D -E /var/log/gitlab/supervisor/sshd.log
33       26710 26702  0 8月09 ?       00:00:00 nginx: worker process
root     26722     2  0 8月09 ?       00:00:00 [kdmflush]
root     26724     2  0 8月09 ?       00:00:00 [bioset]
root     26728     2  0 8月09 ?       00:00:00 [xfs-buf/dm-10]
root     26729     2  0 8月09 ?       00:00:00 [xfs-data/dm-10]
root     26730     2  0 8月09 ?       00:00:00 [xfs-conv/dm-10]
root     26731     2  0 8月09 ?       00:00:00 [xfs-cil/dm-10]
root     26732     2  0 8月09 ?       00:11:40 [xfsaild/dm-10]
root     26804     2  0 8月09 ?       00:00:00 [kdmflush]
root     26806     2  0 8月09 ?       00:00:00 [bioset]
root     26810     2  0 8月09 ?       00:00:00 [xfs-buf/dm-11]
root     26811     2  0 8月09 ?       00:00:00 [xfs-data/dm-11]
root     26812     2  0 8月09 ?       00:00:00 [xfs-conv/dm-11]
root     26813     2  0 8月09 ?       00:00:00 [xfs-cil/dm-11]
root     26814     2  0 8月09 ?       00:11:31 [xfsaild/dm-11]
root     26829 23800  0 8月09 ?       00:01:56 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 18080 -container-ip 172.17.0.5 -container
vagrant  26871 23800  0 8月09 ?       00:01:02 /bin/tini -- /usr/local/bin/jenkins.sh
vagrant  26890 26871  0 8月09 ?       00:53:54 java -Ddocker.host=unix:/var/run/docker.sock -jar /usr/share/jenkins/jenkins.war
root     26893     2  0 8月09 ?       00:00:00 [kdmflush]
root     26894     2  0 8月09 ?       00:00:00 [bioset]
root     26899     2  0 8月09 ?       00:00:00 [xfs-buf/dm-12]
root     26900     2  0 8月09 ?       00:00:00 [xfs-data/dm-12]
root     26901     2  0 8月09 ?       00:00:00 [xfs-conv/dm-12]
root     26902     2  0 8月09 ?       00:00:00 [xfs-cil/dm-12]
root     26903     2  0 8月09 ?       00:00:00 [xfsaild/dm-12]
root     26991 23800  0 8月12 ?       00:01:22 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 48080 -container-ip 172.17.0.6 -container
root     27046 23800  0 8月12 ?       00:00:03 /gofileserver
root     27069     2  0 8月09 ?       00:00:00 [kdmflush]
root     27073     2  0 8月09 ?       00:00:00 [bioset]
root     27105     2  0 8月09 ?       00:00:00 [xfs-buf/dm-13]
root     27106     2  0 8月09 ?       00:00:00 [xfs-data/dm-13]
root     27107     2  0 8月09 ?       00:00:00 [xfs-conv/dm-13]
root     27108     2  0 8月09 ?       00:00:00 [xfs-cil/dm-13]
root     27112     2  0 8月09 ?       00:00:00 [xfsaild/dm-13]
root     27155 23800  0 8月09 ?       00:01:55 docker-proxy -proto tcp -host-ip 0.0.0.0 -host-port 28080 -container-ip 172.17.0.7 -container
root     27205 23800  0 8月09 ?       00:00:00 nginx: master process nginx -g daemon off;
100      27348 27205  0 8月09 ?       00:00:00 nginx: worker process
vagrant  29890 24521  1 8月09 ?       03:54:17 sidekiq 5.0.0 gitlab [0 of 25 busy]
vagrant  29926 26699  0 8月09 ?       00:00:10 unicorn_rails worker[0] -c /home/git/gitlab/config/unicorn.rb -E production
vagrant  29929 26699  0 8月09 ?       00:00:10 unicorn_rails worker[1] -c /home/git/gitlab/config/unicorn.rb -E production
vagrant  29931 26699  0 8月09 ?       00:00:08 unicorn_rails worker[2] -c /home/git/gitlab/config/unicorn.rb -E production
102      29946 24194  0 8月09 ?       00:00:00 postgres: gitlab gitlabhq_production 172.18.0.4(39214) idle
102      30003 24194  0 8月09 ?       00:00:00 postgres: gitlab gitlabhq_production 172.18.0.4(39248) idle
102      30031 24194  0 8月09 ?       00:00:00 postgres: gitlab gitlabhq_production 172.18.0.4(39316) idle
102      30081 24194  0 8月09 ?       00:00:00 postgres: gitlab gitlabhq_production 172.18.0.4(39324) idle
root     32298   633  0 8月19 ?       00:00:00 /sbin/dhclient -d -q -sf /usr/libexec/nm-dhcp-helper -pf /var/run/dhclient-eth0.pid -lf /var/
```

### LEMP 

Nginx 1.12 + MySQL 5.7 + PHP 5.4
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker build --no-cache --force-rm -t tangfeixiong/lemp-demo -f Dockerfile.lemp .
Sending build context to Docker daemon 821.2 kB
Step 1 : FROM centos:7
 ---> 328edcd84f1b
Step 2 : LABEL maintainer "tangfeixiong <tangfx128@gmail.com>" project "stackdocker" repository "containerops/centos7-nginx12-mysql5.6-php5.4" tag "LEMP centos nginx mysql php"
 ---> Running in 2c288aef86c3
 ---> 0506a05f9d95
Removing intermediate container 2c288aef86c3
Step 3 : RUN set -e     && yum install -y epel-release     && echo -e '[nginx]\nname=nginx repo\nbaseurl=http://nginx.org/packages/centos/$releasever/$basearch/\ngpgcheck=0\nenabled=1' > /etc/yum.repos.d/nginx.repo     && install_PKGs="         ca-certificates         nginx         php-cli         php-fpm         php-mysql         php-gd         php-mcrypt         supervisor      "     && yum install -y $install_PKGs     && rpm -V $install_PKGs     && yum clean all     && mkdir -p /var/log/nginx     && ln -sf /dev/stdout /var/log/nginx/access.log 	&& ln -sf /dev/stderr /var/log/nginx/error.log     && mkdir -p /var/log/php/ /run/php /run/php-fpm     && ln -sf /dev/stderr /var/log/php/error.log     && ln -sf /dev/stderr /var/log/php-fpm/error.log     && mkdir -p /var/log/supervisor
 ---> Running in 62bd0433d2ff
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: mirrors.btte.net
 * extras: ftp.sjtu.edu.cn
 * updates: mirrors.btte.net
Resolving Dependencies
--> Running transaction check
---> Package epel-release.noarch 0:7-9 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                Arch             Version         Repository        Size
================================================================================
Installing:
 epel-release           noarch           7-9             extras            14 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 14 k
Installed size: 24 k
Downloading packages:
warning: /var/cache/yum/x86_64/7/extras/packages/epel-release-7-9.noarch.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
Public key for epel-release-7-9.noarch.rpm is not installed
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Importing GPG key 0xF4A80EB5:
 Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
 Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
 Package    : centos-release-7-3.1611.el7.centos.x86_64 (@CentOS)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : epel-release-7-9.noarch                                      1/1 
  Verifying  : epel-release-7-9.noarch                                      1/1 

Installed:
  epel-release.noarch 0:7-9                                                     

Complete!
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: mirrors.btte.net
 * epel: mirrors.tuna.tsinghua.edu.cn
 * extras: ftp.sjtu.edu.cn
 * updates: mirrors.btte.net
Package ca-certificates-2017.2.14-70.1.el7_3.noarch already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package nginx.x86_64 1:1.12.1-1.el7.ngx will be installed
--> Processing Dependency: openssl >= 1.0.1 for package: 1:nginx-1.12.1-1.el7.ngx.x86_64
---> Package php-cli.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: php-common(x86-64) = 5.4.16-42.el7 for package: php-cli-5.4.16-42.el7.x86_64
--> Processing Dependency: libedit.so.0()(64bit) for package: php-cli-5.4.16-42.el7.x86_64
---> Package php-fpm.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: systemd-sysv for package: php-fpm-5.4.16-42.el7.x86_64
---> Package php-gd.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: libpng15.so.15(PNG15_0)(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libjpeg.so.62(LIBJPEG_6.2)(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libt1.so.5()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libpng15.so.15()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libjpeg.so.62()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libfreetype.so.6()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libXpm.so.4()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
--> Processing Dependency: libX11.so.6()(64bit) for package: php-gd-5.4.16-42.el7.x86_64
---> Package php-mcrypt.x86_64 0:5.4.16-7.el7 will be installed
--> Processing Dependency: libmcrypt.so.4()(64bit) for package: php-mcrypt-5.4.16-7.el7.x86_64
---> Package php-mysql.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: php-pdo(x86-64) = 5.4.16-42.el7 for package: php-mysql-5.4.16-42.el7.x86_64
--> Processing Dependency: libmysqlclient.so.18(libmysqlclient_18)(64bit) for package: php-mysql-5.4.16-42.el7.x86_64
--> Processing Dependency: libmysqlclient.so.18()(64bit) for package: php-mysql-5.4.16-42.el7.x86_64
---> Package supervisor.noarch 0:3.1.3-3.el7 will be installed
--> Processing Dependency: python-meld3 >= 0.6.5 for package: supervisor-3.1.3-3.el7.noarch
--> Processing Dependency: python-setuptools for package: supervisor-3.1.3-3.el7.noarch
--> Running transaction check
---> Package freetype.x86_64 0:2.4.11-12.el7 will be installed
---> Package libX11.x86_64 0:1.6.3-3.el7 will be installed
--> Processing Dependency: libX11-common >= 1.6.3-3.el7 for package: libX11-1.6.3-3.el7.x86_64
--> Processing Dependency: libxcb.so.1()(64bit) for package: libX11-1.6.3-3.el7.x86_64
---> Package libXpm.x86_64 0:3.5.11-3.el7 will be installed
---> Package libedit.x86_64 0:3.0-12.20121213cvs.el7 will be installed
---> Package libjpeg-turbo.x86_64 0:1.2.90-5.el7 will be installed
---> Package libmcrypt.x86_64 0:2.5.8-13.el7 will be installed
---> Package libpng.x86_64 2:1.5.13-7.el7_2 will be installed
---> Package mariadb-libs.x86_64 1:5.5.52-1.el7 will be installed
---> Package openssl.x86_64 1:1.0.1e-60.el7_3.1 will be installed
--> Processing Dependency: make for package: 1:openssl-1.0.1e-60.el7_3.1.x86_64
---> Package php-common.x86_64 0:5.4.16-42.el7 will be installed
--> Processing Dependency: libzip.so.2()(64bit) for package: php-common-5.4.16-42.el7.x86_64
---> Package php-pdo.x86_64 0:5.4.16-42.el7 will be installed
---> Package python-meld3.x86_64 0:0.6.10-1.el7 will be installed
---> Package python-setuptools.noarch 0:0.9.8-4.el7 will be installed
--> Processing Dependency: python-backports-ssl_match_hostname for package: python-setuptools-0.9.8-4.el7.noarch
---> Package systemd-sysv.x86_64 0:219-30.el7_3.9 will be installed
---> Package t1lib.x86_64 0:5.1.2-14.el7 will be installed
--> Running transaction check
---> Package libX11-common.noarch 0:1.6.3-3.el7 will be installed
---> Package libxcb.x86_64 0:1.11-4.el7 will be installed
--> Processing Dependency: libXau.so.6()(64bit) for package: libxcb-1.11-4.el7.x86_64
---> Package libzip.x86_64 0:0.10.1-8.el7 will be installed
---> Package make.x86_64 1:3.82-23.el7 will be installed
---> Package python-backports-ssl_match_hostname.noarch 0:3.4.0.2-4.el7 will be installed
--> Processing Dependency: python-backports for package: python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch
--> Running transaction check
---> Package libXau.x86_64 0:1.0.8-2.1.el7 will be installed
---> Package python-backports.x86_64 0:1.0-8.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                            Arch   Version                Repository
                                                                           Size
================================================================================
Installing:
 nginx                              x86_64 1:1.12.1-1.el7.ngx     nginx   716 k
 php-cli                            x86_64 5.4.16-42.el7          base    2.7 M
 php-fpm                            x86_64 5.4.16-42.el7          base    1.4 M
 php-gd                             x86_64 5.4.16-42.el7          base    127 k
 php-mcrypt                         x86_64 5.4.16-7.el7           epel     20 k
 php-mysql                          x86_64 5.4.16-42.el7          base    101 k
 supervisor                         noarch 3.1.3-3.el7            epel    445 k
Installing for dependencies:
 freetype                           x86_64 2.4.11-12.el7          base    391 k
 libX11                             x86_64 1.6.3-3.el7            base    606 k
 libX11-common                      noarch 1.6.3-3.el7            base    162 k
 libXau                             x86_64 1.0.8-2.1.el7          base     29 k
 libXpm                             x86_64 3.5.11-3.el7           base     54 k
 libedit                            x86_64 3.0-12.20121213cvs.el7 base     92 k
 libjpeg-turbo                      x86_64 1.2.90-5.el7           base    134 k
 libmcrypt                          x86_64 2.5.8-13.el7           epel     99 k
 libpng                             x86_64 2:1.5.13-7.el7_2       base    213 k
 libxcb                             x86_64 1.11-4.el7             base    189 k
 libzip                             x86_64 0.10.1-8.el7           base     48 k
 make                               x86_64 1:3.82-23.el7          base    420 k
 mariadb-libs                       x86_64 1:5.5.52-1.el7         base    761 k
 openssl                            x86_64 1:1.0.1e-60.el7_3.1    updates 713 k
 php-common                         x86_64 5.4.16-42.el7          base    564 k
 php-pdo                            x86_64 5.4.16-42.el7          base     98 k
 python-backports                   x86_64 1.0-8.el7              base    5.8 k
 python-backports-ssl_match_hostname
                                    noarch 3.4.0.2-4.el7          base     12 k
 python-meld3                       x86_64 0.6.10-1.el7           epel     73 k
 python-setuptools                  noarch 0.9.8-4.el7            base    396 k
 systemd-sysv                       x86_64 219-30.el7_3.9         updates  64 k
 t1lib                              x86_64 5.1.2-14.el7           base    166 k

Transaction Summary
================================================================================
Install  7 Packages (+22 Dependent packages)

Total download size: 11 M
Installed size: 38 M
Downloading packages:
warning: /var/cache/yum/x86_64/7/epel/packages/libmcrypt-2.5.8-13.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 352c64e5: NOKEY
Public key for libmcrypt-2.5.8-13.el7.x86_64.rpm is not installed
--------------------------------------------------------------------------------
Total                                              1.5 MB/s |  11 MB  00:07     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Importing GPG key 0x352C64E5:
 Userid     : "Fedora EPEL (7) <epel@fedoraproject.org>"
 Fingerprint: 91e9 7d7c 4a5e 96f1 7f3e 888f 6a2f aea2 352c 64e5
 Package    : epel-release-7-9.noarch (@extras)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : libX11-common-1.6.3-3.el7.noarch                            1/29 
  Installing : libedit-3.0-12.20121213cvs.el7.x86_64                       2/29 
  Installing : libXau-1.0.8-2.1.el7.x86_64                                 3/29 
  Installing : libxcb-1.11-4.el7.x86_64                                    4/29 
  Installing : libX11-1.6.3-3.el7.x86_64                                   5/29 
  Installing : t1lib-5.1.2-14.el7.x86_64                                   6/29 
  Installing : libXpm-3.5.11-3.el7.x86_64                                  7/29 
  Installing : freetype-2.4.11-12.el7.x86_64                               8/29 
  Installing : systemd-sysv-219-30.el7_3.9.x86_64                          9/29 
  Installing : 1:make-3.82-23.el7.x86_64                                  10/29 
  Installing : 1:openssl-1.0.1e-60.el7_3.1.x86_64                         11/29 
  Installing : 1:mariadb-libs-5.5.52-1.el7.x86_64                         12/29 
  Installing : python-backports-1.0-8.el7.x86_64                          13/29 
  Installing : python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch   14/29 
  Installing : python-setuptools-0.9.8-4.el7.noarch                       15/29 
  Installing : libzip-0.10.1-8.el7.x86_64                                 16/29 
  Installing : php-common-5.4.16-42.el7.x86_64                            17/29 
  Installing : php-pdo-5.4.16-42.el7.x86_64                               18/29 
  Installing : python-meld3-0.6.10-1.el7.x86_64                           19/29 
  Installing : libmcrypt-2.5.8-13.el7.x86_64                              20/29 
  Installing : 2:libpng-1.5.13-7.el7_2.x86_64                             21/29 
  Installing : libjpeg-turbo-1.2.90-5.el7.x86_64                          22/29 
  Installing : php-gd-5.4.16-42.el7.x86_64                                23/29 
  Installing : php-mcrypt-5.4.16-7.el7.x86_64                             24/29 
  Installing : supervisor-3.1.3-3.el7.noarch                              25/29 
  Installing : php-mysql-5.4.16-42.el7.x86_64                             26/29 
  Installing : php-cli-5.4.16-42.el7.x86_64                               27/29 
  Installing : php-fpm-5.4.16-42.el7.x86_64                               28/29 
  Installing : 1:nginx-1.12.1-1.el7.ngx.x86_64                            29/29 
----------------------------------------------------------------------

Thanks for using nginx!

Please find the official documentation for nginx here:
* http://nginx.org/en/docs/

Please subscribe to nginx-announce mailing list to get
the most important news about nginx:
* http://nginx.org/en/support.html

Commercial subscriptions for nginx are available on:
* http://nginx.com/products/

----------------------------------------------------------------------
  Verifying  : 1:nginx-1.12.1-1.el7.ngx.x86_64                             1/29 
  Verifying  : 1:openssl-1.0.1e-60.el7_3.1.x86_64                          2/29 
  Verifying  : python-backports-ssl_match_hostname-3.4.0.2-4.el7.noarch    3/29 
  Verifying  : php-cli-5.4.16-42.el7.x86_64                                4/29 
  Verifying  : libjpeg-turbo-1.2.90-5.el7.x86_64                           5/29 
  Verifying  : php-mysql-5.4.16-42.el7.x86_64                              6/29 
  Verifying  : libxcb-1.11-4.el7.x86_64                                    7/29 
  Verifying  : 2:libpng-1.5.13-7.el7_2.x86_64                              8/29 
  Verifying  : libmcrypt-2.5.8-13.el7.x86_64                               9/29 
  Verifying  : php-common-5.4.16-42.el7.x86_64                            10/29 
  Verifying  : php-fpm-5.4.16-42.el7.x86_64                               11/29 
  Verifying  : python-setuptools-0.9.8-4.el7.noarch                       12/29 
  Verifying  : php-gd-5.4.16-42.el7.x86_64                                13/29 
  Verifying  : python-meld3-0.6.10-1.el7.x86_64                           14/29 
  Verifying  : libzip-0.10.1-8.el7.x86_64                                 15/29 
  Verifying  : t1lib-5.1.2-14.el7.x86_64                                  16/29 
  Verifying  : python-backports-1.0-8.el7.x86_64                          17/29 
  Verifying  : libXpm-3.5.11-3.el7.x86_64                                 18/29 
  Verifying  : 1:mariadb-libs-5.5.52-1.el7.x86_64                         19/29 
  Verifying  : 1:make-3.82-23.el7.x86_64                                  20/29 
  Verifying  : supervisor-3.1.3-3.el7.noarch                              21/29 
  Verifying  : php-pdo-5.4.16-42.el7.x86_64                               22/29 
  Verifying  : systemd-sysv-219-30.el7_3.9.x86_64                         23/29 
  Verifying  : freetype-2.4.11-12.el7.x86_64                              24/29 
  Verifying  : libXau-1.0.8-2.1.el7.x86_64                                25/29 
  Verifying  : php-mcrypt-5.4.16-7.el7.x86_64                             26/29 
  Verifying  : libedit-3.0-12.20121213cvs.el7.x86_64                      27/29 
  Verifying  : libX11-1.6.3-3.el7.x86_64                                  28/29 
  Verifying  : libX11-common-1.6.3-3.el7.noarch                           29/29 

Installed:
  nginx.x86_64 1:1.12.1-1.el7.ngx        php-cli.x86_64 0:5.4.16-42.el7        
  php-fpm.x86_64 0:5.4.16-42.el7         php-gd.x86_64 0:5.4.16-42.el7         
  php-mcrypt.x86_64 0:5.4.16-7.el7       php-mysql.x86_64 0:5.4.16-42.el7      
  supervisor.noarch 0:3.1.3-3.el7       

Dependency Installed:
  freetype.x86_64 0:2.4.11-12.el7                                               
  libX11.x86_64 0:1.6.3-3.el7                                                   
  libX11-common.noarch 0:1.6.3-3.el7                                            
  libXau.x86_64 0:1.0.8-2.1.el7                                                 
  libXpm.x86_64 0:3.5.11-3.el7                                                  
  libedit.x86_64 0:3.0-12.20121213cvs.el7                                       
  libjpeg-turbo.x86_64 0:1.2.90-5.el7                                           
  libmcrypt.x86_64 0:2.5.8-13.el7                                               
  libpng.x86_64 2:1.5.13-7.el7_2                                                
  libxcb.x86_64 0:1.11-4.el7                                                    
  libzip.x86_64 0:0.10.1-8.el7                                                  
  make.x86_64 1:3.82-23.el7                                                     
  mariadb-libs.x86_64 1:5.5.52-1.el7                                            
  openssl.x86_64 1:1.0.1e-60.el7_3.1                                            
  php-common.x86_64 0:5.4.16-42.el7                                             
  php-pdo.x86_64 0:5.4.16-42.el7                                                
  python-backports.x86_64 0:1.0-8.el7                                           
  python-backports-ssl_match_hostname.noarch 0:3.4.0.2-4.el7                    
  python-meld3.x86_64 0:0.6.10-1.el7                                            
  python-setuptools.noarch 0:0.9.8-4.el7                                        
  systemd-sysv.x86_64 0:219-30.el7_3.9                                          
  t1lib.x86_64 0:5.1.2-14.el7                                                   

Complete!
Loaded plugins: fastestmirror, ovl
Cleaning repos: base epel extras nginx updates
Cleaning up everything
Cleaning up list of fastest mirrors
 ---> 5da94afe1e26
Removing intermediate container 62bd0433d2ff
Step 4 : COPY ./etc/nginx/nginx1.12.conf /etc/nginx/nginx.conf
 ---> 99c1b43395de
Removing intermediate container e7e60d7a499f
Step 5 : COPY ./etc/nginx/default1.12.conf /etc/nginx/conf.d/default.conf
 ---> 0dee544cfce7
Removing intermediate container 787a52bb79b3
Step 6 : COPY ./etc/php/php5.4.ini /etc/php.ini
 ---> c16e6ab20f80
Removing intermediate container 044cc8118d0e
Step 7 : COPY ./etc/php/php-fpm5.4.conf /etc/php-fpm.conf
 ---> dbb2cdd37d09
Removing intermediate container dfc503ab002d
Step 8 : COPY ./etc/php/www5.4.conf /etc/php-fpm.d/www.conf
 ---> 74ab8d375b9b
Removing intermediate container 91ce81f99ef9
Step 9 : COPY ./etc/supervisor/supervisord-php5.4.conf /etc/supervisor/conf.d/supervisord.conf
 ---> 9e77de5321c6
Removing intermediate container d32591988c87
Step 10 : COPY ./src/app/ /usr/share/nginx/html/
 ---> 481fe3823d73
Removing intermediate container f3e978c25d19
Step 11 : RUN groupadd -r mysql     && useradd -r -g mysql mysql
 ---> Running in ec251b5e8d61
 ---> efe69eefccf4
Removing intermediate container ec251b5e8d61
Step 12 : ENV GOSU_VERSION 1.7
 ---> Running in 0827d9df9db2
 ---> 555ea242b795
Removing intermediate container 0827d9df9db2
Step 13 : RUN set -x 	&& curl -jkSL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64 -o /usr/local/bin/gosu 	&& curl -jkSL https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc -o /usr/local/bin/gosu.asc 	&& export GNUPGHOME="$(mktemp -d)" 	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu 	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc 	&& chmod +x /usr/local/bin/gosu 	&& gosu nobody true
 ---> Running in 5d40e5fc257e
+ curl -jkSL https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64 -o /usr/local/bin/gosu
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   600    0   600    0     0    398      0 --:--:--  0:00:01 --:--:--   398
100 2635k  100 2635k    0     0   151k      0  0:00:17  0:00:17 --:--:--  287k
+ curl -jkSL https://github.com/tianon/gosu/releases/download/1.7/gosu-amd64.asc -o /usr/local/bin/gosu.asc
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   604    0   604    0     0    393      0 --:--:--  0:00:01 --:--:--   393
100   543  100   543    0     0    166      0  0:00:03  0:00:03 --:--:--   374
++ mktemp -d
+ export GNUPGHOME=/tmp/tmp.1y5IF8qN2n
+ GNUPGHOME=/tmp/tmp.1y5IF8qN2n
+ gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
gpg: keyring `/tmp/tmp.1y5IF8qN2n/secring.gpg' created
gpg: keyring `/tmp/tmp.1y5IF8qN2n/pubring.gpg' created
gpg: requesting key BF357DD4 from hkp server ha.pool.sks-keyservers.net
gpg: /tmp/tmp.1y5IF8qN2n/trustdb.gpg: trustdb created
gpg: key BF357DD4: public key "Tianon Gravi <tianon@tianon.xyz>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 1
gpg:               imported: 1  (RSA: 1)
+ gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu
gpg: Signature made Sun Nov  8 21:04:08 2015 UTC using RSA key ID BF357DD4
gpg: Good signature from "Tianon Gravi <tianon@tianon.xyz>"
gpg:                 aka "Tianon Gravi <tianon@debian.org>"
gpg:                 aka "Tianon Gravi <tianon@dockerproject.org>"
gpg:                 aka "Andrew Page (tianon) <andrew@infosiftr.com>"
gpg:                 aka "Andrew Page (tianon) <andrew@vitalroute.com>"
gpg:                 aka "Andrew Page (Tianon Gravi) <admwiggin@gmail.com>"
gpg:                 aka "Tianon Gravi (Andrew Page) <tianon@infosiftr.com>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: B42F 6819 007F 00F8 8E36  4FD4 036A 9C25 BF35 7DD4
+ rm -r /tmp/tmp.1y5IF8qN2n /usr/local/bin/gosu.asc
+ chmod +x /usr/local/bin/gosu
+ gosu nobody true
 ---> 51837c6b7816
Removing intermediate container 5d40e5fc257e
Step 14 : RUN mkdir /docker-entrypoint-initdb.d
 ---> Running in 4e7ea6961491
 ---> bed2469aa8ad
Removing intermediate container 4e7ea6961491
Step 15 : RUN yum install -y 		pwgen 		openssl 		perl 	&& yum clean all
 ---> Running in 6f8b9d733b7c
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: mirrors.btte.net
 * epel: mirrors.tuna.tsinghua.edu.cn
 * extras: ftp.sjtu.edu.cn
 * updates: mirrors.btte.net
Package 1:openssl-1.0.1e-60.el7_3.1.x86_64 already installed and latest version
Resolving Dependencies
--> Running transaction check
---> Package perl.x86_64 4:5.16.3-291.el7 will be installed
--> Processing Dependency: perl-libs = 4:5.16.3-291.el7 for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Socket) >= 1.3 for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Scalar::Util) >= 1.10 for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl-macros for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl-libs for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(threads::shared) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(threads) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(constant) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Time::Local) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Time::HiRes) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Storable) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Socket) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Scalar::Util) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Pod::Simple::XHTML) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Pod::Simple::Search) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Getopt::Long) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Filter::Util::Call) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(File::Temp) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(File::Spec::Unix) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(File::Spec::Functions) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(File::Spec) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(File::Path) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Exporter) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Cwd) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: perl(Carp) for package: 4:perl-5.16.3-291.el7.x86_64
--> Processing Dependency: libperl.so()(64bit) for package: 4:perl-5.16.3-291.el7.x86_64
---> Package pwgen.x86_64 0:2.07-1.el7 will be installed
--> Running transaction check
---> Package perl-Carp.noarch 0:1.26-244.el7 will be installed
---> Package perl-Exporter.noarch 0:5.68-3.el7 will be installed
---> Package perl-File-Path.noarch 0:2.09-2.el7 will be installed
---> Package perl-File-Temp.noarch 0:0.23.01-3.el7 will be installed
---> Package perl-Filter.x86_64 0:1.49-3.el7 will be installed
---> Package perl-Getopt-Long.noarch 0:2.40-2.el7 will be installed
--> Processing Dependency: perl(Pod::Usage) >= 1.14 for package: perl-Getopt-Long-2.40-2.el7.noarch
--> Processing Dependency: perl(Text::ParseWords) for package: perl-Getopt-Long-2.40-2.el7.noarch
---> Package perl-PathTools.x86_64 0:3.40-5.el7 will be installed
---> Package perl-Pod-Simple.noarch 1:3.28-4.el7 will be installed
--> Processing Dependency: perl(Pod::Escapes) >= 1.04 for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
--> Processing Dependency: perl(Encode) for package: 1:perl-Pod-Simple-3.28-4.el7.noarch
---> Package perl-Scalar-List-Utils.x86_64 0:1.27-248.el7 will be installed
---> Package perl-Socket.x86_64 0:2.010-4.el7 will be installed
---> Package perl-Storable.x86_64 0:2.45-3.el7 will be installed
---> Package perl-Time-HiRes.x86_64 4:1.9725-3.el7 will be installed
---> Package perl-Time-Local.noarch 0:1.2300-2.el7 will be installed
---> Package perl-constant.noarch 0:1.27-2.el7 will be installed
---> Package perl-libs.x86_64 4:5.16.3-291.el7 will be installed
---> Package perl-macros.x86_64 4:5.16.3-291.el7 will be installed
---> Package perl-threads.x86_64 0:1.87-4.el7 will be installed
---> Package perl-threads-shared.x86_64 0:1.43-6.el7 will be installed
--> Running transaction check
---> Package perl-Encode.x86_64 0:2.51-7.el7 will be installed
---> Package perl-Pod-Escapes.noarch 1:1.04-291.el7 will be installed
---> Package perl-Pod-Usage.noarch 0:1.63-3.el7 will be installed
--> Processing Dependency: perl(Pod::Text) >= 3.15 for package: perl-Pod-Usage-1.63-3.el7.noarch
--> Processing Dependency: perl-Pod-Perldoc for package: perl-Pod-Usage-1.63-3.el7.noarch
---> Package perl-Text-ParseWords.noarch 0:3.29-4.el7 will be installed
--> Running transaction check
---> Package perl-Pod-Perldoc.noarch 0:3.20-4.el7 will be installed
--> Processing Dependency: perl(parent) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: perl(HTTP::Tiny) for package: perl-Pod-Perldoc-3.20-4.el7.noarch
--> Processing Dependency: groff-base for package: perl-Pod-Perldoc-3.20-4.el7.noarch
---> Package perl-podlators.noarch 0:2.5.1-3.el7 will be installed
--> Running transaction check
---> Package groff-base.x86_64 0:1.22.2-8.el7 will be installed
---> Package perl-HTTP-Tiny.noarch 0:0.033-3.el7 will be installed
---> Package perl-parent.noarch 1:0.225-244.el7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                     Arch        Version                Repository
                                                                           Size
================================================================================
Installing:
 perl                        x86_64      4:5.16.3-291.el7       base      8.0 M
 pwgen                       x86_64      2.07-1.el7             epel       24 k
Installing for dependencies:
 groff-base                  x86_64      1.22.2-8.el7           base      942 k
 perl-Carp                   noarch      1.26-244.el7           base       19 k
 perl-Encode                 x86_64      2.51-7.el7             base      1.5 M
 perl-Exporter               noarch      5.68-3.el7             base       28 k
 perl-File-Path              noarch      2.09-2.el7             base       26 k
 perl-File-Temp              noarch      0.23.01-3.el7          base       56 k
 perl-Filter                 x86_64      1.49-3.el7             base       76 k
 perl-Getopt-Long            noarch      2.40-2.el7             base       56 k
 perl-HTTP-Tiny              noarch      0.033-3.el7            base       38 k
 perl-PathTools              x86_64      3.40-5.el7             base       82 k
 perl-Pod-Escapes            noarch      1:1.04-291.el7         base       51 k
 perl-Pod-Perldoc            noarch      3.20-4.el7             base       87 k
 perl-Pod-Simple             noarch      1:3.28-4.el7           base      216 k
 perl-Pod-Usage              noarch      1.63-3.el7             base       27 k
 perl-Scalar-List-Utils      x86_64      1.27-248.el7           base       36 k
 perl-Socket                 x86_64      2.010-4.el7            base       49 k
 perl-Storable               x86_64      2.45-3.el7             base       77 k
 perl-Text-ParseWords        noarch      3.29-4.el7             base       14 k
 perl-Time-HiRes             x86_64      4:1.9725-3.el7         base       45 k
 perl-Time-Local             noarch      1.2300-2.el7           base       24 k
 perl-constant               noarch      1.27-2.el7             base       19 k
 perl-libs                   x86_64      4:5.16.3-291.el7       base      688 k
 perl-macros                 x86_64      4:5.16.3-291.el7       base       43 k
 perl-parent                 noarch      1:0.225-244.el7        base       12 k
 perl-podlators              noarch      2.5.1-3.el7            base      112 k
 perl-threads                x86_64      1.87-4.el7             base       49 k
 perl-threads-shared         x86_64      1.43-6.el7             base       39 k

Transaction Summary
================================================================================
Install  2 Packages (+27 Dependent packages)

Total download size: 12 M
Installed size: 40 M
Downloading packages:
--------------------------------------------------------------------------------
Total                                              3.3 MB/s |  12 MB  00:03     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : groff-base-1.22.2-8.el7.x86_64                              1/29 
  Installing : 1:perl-parent-0.225-244.el7.noarch                          2/29 
  Installing : perl-HTTP-Tiny-0.033-3.el7.noarch                           3/29 
  Installing : perl-podlators-2.5.1-3.el7.noarch                           4/29 
  Installing : perl-Pod-Perldoc-3.20-4.el7.noarch                          5/29 
  Installing : 1:perl-Pod-Escapes-1.04-291.el7.noarch                      6/29 
  Installing : perl-Encode-2.51-7.el7.x86_64                               7/29 
  Installing : perl-Text-ParseWords-3.29-4.el7.noarch                      8/29 
  Installing : perl-Pod-Usage-1.63-3.el7.noarch                            9/29 
  Installing : perl-Storable-2.45-3.el7.x86_64                            10/29 
  Installing : perl-Exporter-5.68-3.el7.noarch                            11/29 
  Installing : perl-constant-1.27-2.el7.noarch                            12/29 
  Installing : perl-Time-Local-1.2300-2.el7.noarch                        13/29 
  Installing : perl-Socket-2.010-4.el7.x86_64                             14/29 
  Installing : perl-Carp-1.26-244.el7.noarch                              15/29 
  Installing : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      16/29 
  Installing : perl-PathTools-3.40-5.el7.x86_64                           17/29 
  Installing : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 18/29 
  Installing : 4:perl-libs-5.16.3-291.el7.x86_64                          19/29 
  Installing : 4:perl-macros-5.16.3-291.el7.x86_64                        20/29 
  Installing : 1:perl-Pod-Simple-3.28-4.el7.noarch                        21/29 
  Installing : perl-File-Temp-0.23.01-3.el7.noarch                        22/29 
  Installing : perl-File-Path-2.09-2.el7.noarch                           23/29 
  Installing : perl-threads-shared-1.43-6.el7.x86_64                      24/29 
  Installing : perl-threads-1.87-4.el7.x86_64                             25/29 
  Installing : perl-Filter-1.49-3.el7.x86_64                              26/29 
  Installing : perl-Getopt-Long-2.40-2.el7.noarch                         27/29 
  Installing : 4:perl-5.16.3-291.el7.x86_64                               28/29 
  Installing : pwgen-2.07-1.el7.x86_64                                    29/29 
  Verifying  : perl-HTTP-Tiny-0.033-3.el7.noarch                           1/29 
  Verifying  : perl-threads-shared-1.43-6.el7.x86_64                       2/29 
  Verifying  : perl-Storable-2.45-3.el7.x86_64                             3/29 
  Verifying  : perl-Exporter-5.68-3.el7.noarch                             4/29 
  Verifying  : perl-constant-1.27-2.el7.noarch                             5/29 
  Verifying  : perl-PathTools-3.40-5.el7.x86_64                            6/29 
  Verifying  : 1:perl-Pod-Escapes-1.04-291.el7.noarch                      7/29 
  Verifying  : pwgen-2.07-1.el7.x86_64                                     8/29 
  Verifying  : 1:perl-parent-0.225-244.el7.noarch                          9/29 
  Verifying  : groff-base-1.22.2-8.el7.x86_64                             10/29 
  Verifying  : perl-File-Temp-0.23.01-3.el7.noarch                        11/29 
  Verifying  : 1:perl-Pod-Simple-3.28-4.el7.noarch                        12/29 
  Verifying  : perl-Time-Local-1.2300-2.el7.noarch                        13/29 
  Verifying  : perl-Pod-Perldoc-3.20-4.el7.noarch                         14/29 
  Verifying  : perl-Socket-2.010-4.el7.x86_64                             15/29 
  Verifying  : perl-Carp-1.26-244.el7.noarch                              16/29 
  Verifying  : 4:perl-Time-HiRes-1.9725-3.el7.x86_64                      17/29 
  Verifying  : perl-Scalar-List-Utils-1.27-248.el7.x86_64                 18/29 
  Verifying  : 4:perl-libs-5.16.3-291.el7.x86_64                          19/29 
  Verifying  : 4:perl-macros-5.16.3-291.el7.x86_64                        20/29 
  Verifying  : perl-Pod-Usage-1.63-3.el7.noarch                           21/29 
  Verifying  : perl-Encode-2.51-7.el7.x86_64                              22/29 
  Verifying  : perl-podlators-2.5.1-3.el7.noarch                          23/29 
  Verifying  : perl-Getopt-Long-2.40-2.el7.noarch                         24/29 
  Verifying  : perl-File-Path-2.09-2.el7.noarch                           25/29 
  Verifying  : 4:perl-5.16.3-291.el7.x86_64                               26/29 
  Verifying  : perl-threads-1.87-4.el7.x86_64                             27/29 
  Verifying  : perl-Filter-1.49-3.el7.x86_64                              28/29 
  Verifying  : perl-Text-ParseWords-3.29-4.el7.noarch                     29/29 

Installed:
  perl.x86_64 4:5.16.3-291.el7             pwgen.x86_64 0:2.07-1.el7            

Dependency Installed:
  groff-base.x86_64 0:1.22.2-8.el7                                              
  perl-Carp.noarch 0:1.26-244.el7                                               
  perl-Encode.x86_64 0:2.51-7.el7                                               
  perl-Exporter.noarch 0:5.68-3.el7                                             
  perl-File-Path.noarch 0:2.09-2.el7                                            
  perl-File-Temp.noarch 0:0.23.01-3.el7                                         
  perl-Filter.x86_64 0:1.49-3.el7                                               
  perl-Getopt-Long.noarch 0:2.40-2.el7                                          
  perl-HTTP-Tiny.noarch 0:0.033-3.el7                                           
  perl-PathTools.x86_64 0:3.40-5.el7                                            
  perl-Pod-Escapes.noarch 1:1.04-291.el7                                        
  perl-Pod-Perldoc.noarch 0:3.20-4.el7                                          
  perl-Pod-Simple.noarch 1:3.28-4.el7                                           
  perl-Pod-Usage.noarch 0:1.63-3.el7                                            
  perl-Scalar-List-Utils.x86_64 0:1.27-248.el7                                  
  perl-Socket.x86_64 0:2.010-4.el7                                              
  perl-Storable.x86_64 0:2.45-3.el7                                             
  perl-Text-ParseWords.noarch 0:3.29-4.el7                                      
  perl-Time-HiRes.x86_64 4:1.9725-3.el7                                         
  perl-Time-Local.noarch 0:1.2300-2.el7                                         
  perl-constant.noarch 0:1.27-2.el7                                             
  perl-libs.x86_64 4:5.16.3-291.el7                                             
  perl-macros.x86_64 4:5.16.3-291.el7                                           
  perl-parent.noarch 1:0.225-244.el7                                            
  perl-podlators.noarch 0:2.5.1-3.el7                                           
  perl-threads.x86_64 0:1.87-4.el7                                              
  perl-threads-shared.x86_64 0:1.43-6.el7                                       

Complete!
Loaded plugins: fastestmirror, ovl
Cleaning repos: base epel extras nginx updates
Cleaning up everything
Cleaning up list of fastest mirrors
 ---> 7a237e42fd55
Removing intermediate container 6f8b9d733b7c
Step 16 : RUN set -ex; 	key='A4A9406876FCBD3C456770C88C718D3B5072E1F5'; 	export GNUPGHOME="$(mktemp -d)"; 	gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; 	gpg --export "$key" > /mysql.gpg; 	rm -r "$GNUPGHOME"; 	rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n'
 ---> Running in 202b7a1a6131
+ key=A4A9406876FCBD3C456770C88C718D3B5072E1F5
++ mktemp -d
+ export GNUPGHOME=/tmp/tmp.JMaS9JXnn3
+ GNUPGHOME=/tmp/tmp.JMaS9JXnn3
+ gpg --keyserver ha.pool.sks-keyservers.net --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5
gpg: keyring `/tmp/tmp.JMaS9JXnn3/secring.gpg' created
gpg: keyring `/tmp/tmp.JMaS9JXnn3/pubring.gpg' created
gpg: requesting key 5072E1F5 from hkp server ha.pool.sks-keyservers.net
gpg: /tmp/tmp.JMaS9JXnn3/trustdb.gpg: trustdb created
gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
gpg: no ultimately trusted keys found
gpg: Total number processed: 1
gpg:               imported: 1
+ gpg --export A4A9406876FCBD3C456770C88C718D3B5072E1F5
+ rm -r /tmp/tmp.JMaS9JXnn3
+ rpm -q gpg-pubkey --qf '%{NAME}-%{VERSION}-%{RELEASE}\t%{SUMMARY}\n'
gpg-pubkey-f4a80eb5-53a7ff4b	gpg(CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>)
gpg-pubkey-352c64e5-52ae6884	gpg(Fedora EPEL (7) <epel@fedoraproject.org>)
 ---> 7762ba4d77ec
Removing intermediate container 202b7a1a6131
Step 17 : ENV MYSQL_MAJOR 5.7
 ---> Running in a42e47865aec
 ---> ddd47d601c1c
Removing intermediate container a42e47865aec
Step 18 : ENV MYSQL_VERSION 5.7.19-1.el7
 ---> Running in 2b07156008b9
 ---> 9778d04b579e
Removing intermediate container 2b07156008b9
Step 19 : RUN curl -jkSL https://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm -O     && rpm -ivh mysql57-community-release-el7-9.noarch.rpm     && rm -f mysql57-community-release-el7-9.noarch.rpm
 ---> Running in eae5403ba02c
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:00:01 --:--:--     0
100  9224  100  9224    0     0   4081      0  0:00:02  0:00:02 --:--:--  4081
warning: mysql57-community-release-el7-9.noarch.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY
Preparing...                          ########################################
Updating / installing...
mysql57-community-release-el7-9       ########################################
 ---> fb5f4aa79372
Removing intermediate container eae5403ba02c
Step 20 : RUN yum install -y mysql-community-server     && rpm -V mysql-community-server     && yum clean all
 ---> Running in 0c8a585bc9c9
Loaded plugins: fastestmirror, ovl
Determining fastest mirrors
 * base: mirrors.btte.net
 * epel: mirrors.tuna.tsinghua.edu.cn
 * extras: mirrors.aliyun.com
 * updates: mirrors.btte.net
Resolving Dependencies
--> Running transaction check
---> Package mysql-community-server.x86_64 0:5.7.19-1.el7 will be installed
--> Processing Dependency: mysql-community-common(x86-64) = 5.7.19-1.el7 for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: mysql-community-client(x86-64) >= 5.7.9 for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: net-tools for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: libnuma.so.1(libnuma_1.2)(64bit) for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: libnuma.so.1(libnuma_1.1)(64bit) for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: libaio.so.1(LIBAIO_0.4)(64bit) for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: libaio.so.1(LIBAIO_0.1)(64bit) for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: libnuma.so.1()(64bit) for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Processing Dependency: libaio.so.1()(64bit) for package: mysql-community-server-5.7.19-1.el7.x86_64
--> Running transaction check
---> Package libaio.x86_64 0:0.3.109-13.el7 will be installed
---> Package mysql-community-client.x86_64 0:5.7.19-1.el7 will be installed
--> Processing Dependency: mysql-community-libs(x86-64) >= 5.7.9 for package: mysql-community-client-5.7.19-1.el7.x86_64
---> Package mysql-community-common.x86_64 0:5.7.19-1.el7 will be installed
---> Package net-tools.x86_64 0:2.0-0.17.20131004git.el7 will be installed
---> Package numactl-libs.x86_64 0:2.0.9-6.el7_2 will be installed
--> Running transaction check
---> Package mariadb-libs.x86_64 1:5.5.52-1.el7 will be obsoleted
--> Processing Dependency: libmysqlclient.so.18()(64bit) for package: php-mysql-5.4.16-42.el7.x86_64
--> Processing Dependency: libmysqlclient.so.18(libmysqlclient_18)(64bit) for package: php-mysql-5.4.16-42.el7.x86_64
---> Package mysql-community-libs.x86_64 0:5.7.19-1.el7 will be obsoleting
--> Running transaction check
---> Package mysql-community-libs-compat.x86_64 0:5.7.19-1.el7 will be obsoleting
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                Arch   Version                  Repository         Size
================================================================================
Installing:
 mysql-community-libs   x86_64 5.7.19-1.el7             mysql57-community 2.1 M
     replacing  mariadb-libs.x86_64 1:5.5.52-1.el7
 mysql-community-libs-compat
                        x86_64 5.7.19-1.el7             mysql57-community 2.0 M
     replacing  mariadb-libs.x86_64 1:5.5.52-1.el7
 mysql-community-server x86_64 5.7.19-1.el7             mysql57-community 164 M
Installing for dependencies:
 libaio                 x86_64 0.3.109-13.el7           base               24 k
 mysql-community-client x86_64 5.7.19-1.el7             mysql57-community  24 M
 mysql-community-common x86_64 5.7.19-1.el7             mysql57-community 272 k
 net-tools              x86_64 2.0-0.17.20131004git.el7 base              304 k
 numactl-libs           x86_64 2.0.9-6.el7_2            base               29 k

Transaction Summary
================================================================================
Install  3 Packages (+5 Dependent packages)

Total download size: 192 M
Downloading packages:
warning: /var/cache/yum/x86_64/7/mysql57-community/packages/mysql-community-common-5.7.19-1.el7.x86_64.rpm: Header V3 DSA/SHA1 Signature, key ID 5072e1f5: NOKEY
Public key for mysql-community-common-5.7.19-1.el7.x86_64.rpm is not installed
--------------------------------------------------------------------------------
Total                                              385 kB/s | 192 MB  08:31     
Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
Importing GPG key 0x5072E1F5:
 Userid     : "MySQL Release Engineering <mysql-build@oss.oracle.com>"
 Fingerprint: a4a9 4068 76fc bd3c 4567 70c8 8c71 8d3b 5072 e1f5
 Package    : mysql57-community-release-el7-9.noarch (installed)
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-mysql
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
Warning: RPMDB altered outside of yum.
  Installing : mysql-community-common-5.7.19-1.el7.x86_64                   1/9 
  Installing : mysql-community-libs-5.7.19-1.el7.x86_64                     2/9 
  Installing : mysql-community-client-5.7.19-1.el7.x86_64                   3/9 
  Installing : libaio-0.3.109-13.el7.x86_64                                 4/9 
  Installing : numactl-libs-2.0.9-6.el7_2.x86_64                            5/9 
  Installing : net-tools-2.0-0.17.20131004git.el7.x86_64                    6/9 
  Installing : mysql-community-server-5.7.19-1.el7.x86_64                   7/9 
  Installing : mysql-community-libs-compat-5.7.19-1.el7.x86_64              8/9 
  Erasing    : 1:mariadb-libs-5.5.52-1.el7.x86_64                           9/9 
  Verifying  : mysql-community-client-5.7.19-1.el7.x86_64                   1/9 
  Verifying  : mysql-community-libs-compat-5.7.19-1.el7.x86_64              2/9 
  Verifying  : net-tools-2.0-0.17.20131004git.el7.x86_64                    3/9 
  Verifying  : mysql-community-libs-5.7.19-1.el7.x86_64                     4/9 
  Verifying  : mysql-community-server-5.7.19-1.el7.x86_64                   5/9 
  Verifying  : numactl-libs-2.0.9-6.el7_2.x86_64                            6/9 
  Verifying  : mysql-community-common-5.7.19-1.el7.x86_64                   7/9 
  Verifying  : libaio-0.3.109-13.el7.x86_64                                 8/9 
  Verifying  : 1:mariadb-libs-5.5.52-1.el7.x86_64                           9/9 

Installed:
  mysql-community-libs.x86_64 0:5.7.19-1.el7                                    
  mysql-community-libs-compat.x86_64 0:5.7.19-1.el7                             
  mysql-community-server.x86_64 0:5.7.19-1.el7                                  

Dependency Installed:
  libaio.x86_64 0:0.3.109-13.el7                                                
  mysql-community-client.x86_64 0:5.7.19-1.el7                                  
  mysql-community-common.x86_64 0:5.7.19-1.el7                                  
  net-tools.x86_64 0:2.0-0.17.20131004git.el7                                   
  numactl-libs.x86_64 0:2.0.9-6.el7_2                                           

Replaced:
  mariadb-libs.x86_64 1:5.5.52-1.el7                                            

Complete!
Loaded plugins: fastestmirror, ovl
Cleaning repos: base epel extras mysql-connectors-community
              : mysql-tools-community mysql57-community nginx updates
Cleaning up everything
Cleaning up list of fastest mirrors
 ---> 8f8680cf6fed
Removing intermediate container 0c8a585bc9c9
Step 21 : RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf 	&& echo -e '[mysqld]\nskip-host-cache\nskip-name-resolve' > /etc/my.cnf.d/docker.cnf
 ---> Running in 133f42654972
 ---> 21ce33a80705
Removing intermediate container 133f42654972
Step 22 : VOLUME /var/lib/mysql
 ---> Running in 2ddb8df2fe46
 ---> 23520c22dcfb
Removing intermediate container 2ddb8df2fe46
Step 23 : COPY ./etc/mysql/docker-entrypoint.sh /usr/local/bin/
 ---> 558a28b926cf
Removing intermediate container 4fc9f481932c
Step 24 : RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
 ---> Running in 8e4a9318af9f
 ---> 1017d9485b03
Removing intermediate container 8e4a9318af9f
Step 25 : COPY ./etc/supervisor/supervisord-mysql5.7-php5.4.conf /etc/supervisor/conf.d/supervisord.conf
 ---> 23869600bfbe
Removing intermediate container 098b62e3c307
Step 26 : COPY ./src/initdb/* /docker-entrypoint-initdb.d/
 ---> 18ffe09a437a
Removing intermediate container f7117b557c78
Step 27 : EXPOSE 80 443 3306
 ---> Running in 51cfd54ba578
 ---> 9f8577151d75
Removing intermediate container 51cfd54ba578
Step 28 : CMD /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/supervisord.conf --logfile=/var/log/supervisor/supervisord.log
 ---> Running in a715d35fd4b7
 ---> 22c0adaf4392
Removing intermediate container a715d35fd4b7
Successfully built 22c0adaf4392
```

Test
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ sudo rm -rf /tmp/tmplog/*
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker run -d -v /tmp/tmplog:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=testuser -e MYSQL_PASSWORD=testpassword -e MYSQL_DATABASE=testdb -p 8999:80 --name=demo tangfeixiong/lemp-demo
8bfbf42555c3cf3cffca19704b7e295d4497455c6594a46d5f82d775f131dc12
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker logs demo
2017-08-20 19:51:24,744 CRIT Supervisor running as root (no user in config file)
2017-08-20 19:51:24,761 INFO supervisord started with pid 1
2017-08-20 19:51:25,766 INFO spawned: 'nginx' with pid 9
2017-08-20 19:51:25,768 INFO spawned: 'php-fpm' with pid 10
2017-08-20 19:51:25,772 INFO spawned: 'mysql' with pid 11
2017-08-20 19:51:27,363 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2017-08-20 19:51:27,363 INFO success: php-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2017-08-20 19:51:27,363 INFO success: mysql entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

Data
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ ls /tmp/tmplog/
auto.cnf    client-cert.pem  ibdata1      ibtmp1      mysql.sock.lock     public_key.pem   sys
ca-key.pem  client-key.pem   ib_logfile0  mysql       performance_schema  server-cert.pem  testdb
ca.pem      ib_buffer_pool   ib_logfile1  mysql.sock  private_key.pem     server-key.pem
```

### Debug

Forget to specify database
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker run -d -v /tmp/tmplog:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=password -e MYSQL_USER=testuser -e MYSQL_PASSWORD=testpassword -p 8999:80 --name=demo tangfeixiong/lemp-demo
f6c3957598f94f74b3f0f04e9c31bd20dc2c21a4119fa747ac2153bd841bbf38
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker logs demo
2017-08-20 18:54:46,190 CRIT Supervisor running as root (no user in config file)
2017-08-20 18:54:46,205 INFO supervisord started with pid 1
2017-08-20 18:54:47,210 INFO spawned: 'nginx' with pid 10
2017-08-20 18:54:47,214 INFO spawned: 'php-fpm' with pid 11
2017-08-20 18:54:47,222 INFO spawned: 'mysql' with pid 12
2017-08-20 18:54:47,684 INFO exited: mysql (exit status 1; not expected)
2017-08-20 18:54:48,687 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2017-08-20 18:54:48,687 INFO success: php-fpm entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2017-08-20 18:54:48,691 INFO spawned: 'mysql' with pid 46
2017-08-20 18:54:48,828 INFO exited: mysql (exit status 1; not expected)
2017-08-20 18:54:50,833 INFO spawned: 'mysql' with pid 74
2017-08-20 18:54:50,949 INFO exited: mysql (exit status 1; not expected)
2017-08-20 18:54:53,959 INFO spawned: 'mysql' with pid 102
2017-08-20 18:54:54,101 INFO exited: mysql (exit status 1; not expected)
2017-08-20 18:54:55,104 INFO gave up: mysql entered FATAL state, too many start retries too quickly
```

To create db
```
[vagrant@localhost centos7-nginx1.12-mysql5.6-php5.4]$ docker exec -ti demo bash
[root@f6c3957598f9 /]# ls
anaconda-post.log  dev			       entrypoint.sh  home  lib64	media  mysql.gpg  proc	run   srv	       sys  usr
bin		   docker-entrypoint-initdb.d  etc	      lib   lost+found	mnt    opt	  root	sbin  supervisord.pid  tmp  var
[root@f6c3957598f9 /]# ls docker-entrypoint-initdb.d/
testdb.sql
[root@f6c3957598f9 /]# printenv
HOSTNAME=f6c3957598f9
MYSQL_VERSION=5.7.19-1.el7
MYSQL_PASSWORD=testpassword
LS_COLORS=
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
SHLVL=1
HOME=/root
MYSQL_MAJOR=5.7
GOSU_VERSION=1.7
MYSQL_USER=testuser
MYSQL_ROOT_PASSWORD=password
_=/usr/bin/printenv
[root@f6c3957598f9 /]# /usr/local/bin/docker-entrypoint.sh mysqld
Initializing database
2017-08-20T19:00:18.752664Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
2017-08-20T19:00:18.831995Z 0 [Warning] InnoDB: New log files created, LSN=45790
2017-08-20T19:00:18.853417Z 0 [Warning] InnoDB: Creating foreign key constraint system tables.
2017-08-20T19:00:18.916519Z 0 [Warning] No existing UUID has been found, so we assume that this is the first time that this server has been started. Generating a new UUID: cf39e553-85d9-11e7-bf44-4abb98e742bf.
2017-08-20T19:00:18.917379Z 0 [Warning] Gtid table is not ready to be used. Table 'mysql.gtid_executed' cannot be opened.
2017-08-20T19:00:18.920707Z 1 [Warning] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
Database initialized
Initializing certificates
Generating a 2048 bit RSA private key
......+++
................................................................+++
unable to write 'random state'
writing new private key to 'ca-key.pem'
-----
Generating a 2048 bit RSA private key
.....................+++
........................+++
unable to write 'random state'
writing new private key to 'server-key.pem'
-----
Generating a 2048 bit RSA private key
.....................................................................................................................................+++
........................................................................................................................+++
unable to write 'random state'
writing new private key to 'client-key.pem'
-----
Certificates initialized
MySQL init process in progress...
2017-08-20T19:00:21.927226Z 0 [Warning] TIMESTAMP with implicit DEFAULT value is deprecated. Please use --explicit_defaults_for_timestamp server option (see documentation for more details).
2017-08-20T19:00:21.928365Z 0 [Note] mysqld (mysqld 5.7.19) starting as process 250 ...
2017-08-20T19:00:21.931676Z 0 [Note] InnoDB: PUNCH HOLE support available
2017-08-20T19:00:21.931801Z 0 [Note] InnoDB: Mutexes and rw_locks use GCC atomic builtins
2017-08-20T19:00:21.931964Z 0 [Note] InnoDB: Uses event mutexes
2017-08-20T19:00:21.932047Z 0 [Note] InnoDB: GCC builtin __atomic_thread_fence() is used for memory barrier
2017-08-20T19:00:21.932094Z 0 [Note] InnoDB: Compressed tables use zlib 1.2.3
2017-08-20T19:00:21.932265Z 0 [Note] InnoDB: Using Linux native AIO
2017-08-20T19:00:21.933482Z 0 [Note] InnoDB: Number of pools: 1
2017-08-20T19:00:21.933804Z 0 [Note] InnoDB: Using CPU crc32 instructions
2017-08-20T19:00:21.935703Z 0 [Note] InnoDB: Initializing buffer pool, total size = 128M, instances = 1, chunk size = 128M
2017-08-20T19:00:21.942408Z 0 [Note] InnoDB: Completed initialization of buffer pool
2017-08-20T19:00:21.944953Z 0 [Note] InnoDB: If the mysqld execution user is authorized, page cleaner thread priority can be changed. See the man page of setpriority().
2017-08-20T19:00:21.957811Z 0 [Note] InnoDB: Highest supported file format is Barracuda.
2017-08-20T19:00:21.969152Z 0 [Note] InnoDB: Creating shared tablespace for temporary tables
2017-08-20T19:00:21.969866Z 0 [Note] InnoDB: Setting file './ibtmp1' size to 12 MB. Physically writing the file full; Please wait ...
2017-08-20T19:00:21.975828Z 0 [Note] InnoDB: File './ibtmp1' size is now 12 MB.
2017-08-20T19:00:21.979015Z 0 [Note] InnoDB: 96 redo rollback segment(s) found. 96 redo rollback segment(s) are active.
2017-08-20T19:00:21.979157Z 0 [Note] InnoDB: 32 non-redo rollback segment(s) are active.
2017-08-20T19:00:21.981114Z 0 [Note] InnoDB: 5.7.19 started; log sequence number 2539315
2017-08-20T19:00:21.982707Z 0 [Note] InnoDB: Loading buffer pool(s) from /var/lib/mysql/ib_buffer_pool
2017-08-20T19:00:21.984306Z 0 [Note] Plugin 'FEDERATED' is disabled.
2017-08-20T19:00:21.987328Z 0 [Note] InnoDB: Buffer pool(s) load completed at 170820 19:00:21
2017-08-20T19:00:21.994173Z 0 [Note] Found ca.pem, server-cert.pem and server-key.pem in data directory. Trying to enable SSL support using them.
2017-08-20T19:00:21.994372Z 0 [Warning] CA certificate ca.pem is self signed.
2017-08-20T19:00:22.007252Z 0 [Note] Event Scheduler: Loaded 0 events
2017-08-20T19:00:22.007949Z 0 [Note] mysqld: ready for connections.
Version: '5.7.19'  socket: '/var/lib/mysql/mysql.sock'  port: 0  MySQL Community Server (GPL)
2017-08-20T19:00:22.008045Z 0 [Note] Executing 'SELECT * FROM INFORMATION_SCHEMA.TABLES;' to get a list of tables using the deprecated partition engine. You may use the startup option '--disable-partition-engine-check' to skip this check. 
2017-08-20T19:00:22.008067Z 0 [Note] Beginning of list of non-natively partitioned tables
2017-08-20T19:00:22.020881Z 0 [Note] End of list of non-natively partitioned tables
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
mysql: [Warning] Using a password on the command line interface can be insecure.
mysql: [Warning] Using a password on the command line interface can be insecure.

/usr/local/bin/docker-entrypoint.sh: running /docker-entrypoint-initdb.d/testdb.sql
mysql: [Warning] Using a password on the command line interface can be insecure.
ERROR 1046 (3D000) at line 23: No database selected
[root@f6c3957598f9 /]# ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 18:54 ?        00:00:00 /usr/bin/python /usr/bin/supervisord --configuration=/etc/supervisor/conf.d/supervisord.conf 
root        10     1  0 18:54 ?        00:00:00 nginx: master process nginx -g daemon off;
root        11     1  0 18:54 ?        00:00:00 php-fpm: master process (/etc/php-fpm.conf)
nginx       16    10  0 18:54 ?        00:00:00 nginx: worker process
nginx       24    11  0 18:54 ?        00:00:00 php-fpm: pool www
nginx       25    11  0 18:54 ?        00:00:00 php-fpm: pool www
nginx       26    11  0 18:54 ?        00:00:00 php-fpm: pool www
nginx       27    11  0 18:54 ?        00:00:00 php-fpm: pool www
nginx       28    11  0 18:54 ?        00:00:00 php-fpm: pool www
root       148     0  0 18:57 ?        00:00:00 bash
mysql      250     1  5 19:00 ?        00:00:02 mysqld --skip-networking --socket=/var/lib/mysql/mysql.sock
root       294   148  0 19:01 ?        00:00:00 ps -ef
[root@f6c3957598f9 /]# mysql --version
mysql  Ver 14.14 Distrib 5.7.19, for Linux (x86_64) using  EditLine wrapper
[root@f6c3957598f9 /]# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 10
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> use mysql;             
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+---------------------------+
| Tables_in_mysql           |
+---------------------------+
| columns_priv              |
| db                        |
| engine_cost               |
| event                     |
| func                      |
| general_log               |
| gtid_executed             |
| help_category             |
| help_keyword              |
| help_relation             |
| help_topic                |
| innodb_index_stats        |
| innodb_table_stats        |
| ndb_binlog_index          |
| plugin                    |
| proc                      |
| procs_priv                |
| proxies_priv              |
| server_cost               |
| servers                   |
| slave_master_info         |
| slave_relay_log_info      |
| slave_worker_info         |
| slow_log                  |
| tables_priv               |
| time_zone                 |
| time_zone_leap_second     |
| time_zone_name            |
| time_zone_transition      |
| time_zone_transition_type |
| user                      |
+---------------------------+
31 rows in set (0.00 sec)

mysql> select host,user from mysql.user;
+-----------+-----------+
| host      | user      |
+-----------+-----------+
| %         | root      |
| %         | testuser  |
| localhost | mysql.sys |
| localhost | root      |
+-----------+-----------+
4 rows in set (0.00 sec)

mysql> exit
Bye
[root@f6c3957598f9 /]# mysql -u root -p    
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE testdb;
Query OK, 1 row affected (0.01 sec)

mysql> drop DATABASE testdb;
Query OK, 0 rows affected (0.00 sec)

mysql> exit
Bye
[root@f6c3957598f9 /]# mysql -u testuser -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE testdb;
ERROR 1044 (42000): Access denied for user 'testuser'@'%' to database 'testdb'
mysql> exit
Bye
[root@f6c3957598f9 /]# mysql -u root -p    
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE testdb;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testdb             |
+--------------------+
5 rows in set (0.01 sec)

mysql> GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'localhost';
ERROR 1133 (42000): Can't find any matching row in the user table
mysql> GRANT ALL PRIVILEGES ON testdb.* TO 'testuser'@'%';        
Query OK, 0 rows affected (0.00 sec)

mysql> source /docker-entrypoint-initdb.d/testdb.sql 
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

ERROR 1046 (3D000): No database selected
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

ERROR 1046 (3D000): No database selected
Query OK, 0 rows affected (0.01 sec)

ERROR 1046 (3D000): No database selected
ERROR 1046 (3D000): No database selected
ERROR 1046 (3D000): No database selected
ERROR 1046 (3D000): No database selected
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> use testdb;
Database changed
mysql> source /docker-entrypoint-initdb.d/testdb.sql
Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected, 1 warning (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> show tables;
+------------------+
| Tables_in_testdb |
+------------------+
| counter          |
+------------------+
1 row in set (0.00 sec)

mysql> select * from counter
    -> ;
+-----------------------+
| text                  |
+-----------------------+
| 2017.02.07UTC15:43:47 |
| 2017.02.07UTC15:43:49 |
| 2017.02.07UTC15:43:49 |
| 2017.02.07UTC15:43:50 |
+-----------------------+
4 rows in set (0.00 sec)

mysql> exit
Bye
[root@f6c3957598f9 /]# exit
exit
```

Access
```
[root@f6c3957598f9 /]# mysql -u testuser -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 5.7.19 MySQL Community Server (GPL)

Copyright (c) 2000, 2017, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use testdb;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from counter;
+-----------------------+
| text                  |
+-----------------------+
| 2017.02.07UTC15:43:47 |
| 2017.02.07UTC15:43:49 |
| 2017.02.07UTC15:43:49 |
| 2017.02.07UTC15:43:50 |
| 2017.08.21CST03:33:58 |
| 2017.08.21CST03:44:28 |
| 2017.08.21CST03:44:30 |
+-----------------------+
7 rows in set (0.00 sec)

mysql> exit
Bye
[root@f6c3957598f9 /]# exit
exit
```
