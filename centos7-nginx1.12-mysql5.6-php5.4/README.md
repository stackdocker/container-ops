### Instruction

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