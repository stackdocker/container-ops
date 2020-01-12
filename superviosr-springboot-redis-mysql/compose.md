
__Download__

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   617    0   617    0     0    699      0 --:--:-- --:--:-- --:--:--   698
100 16.2M  100 16.2M    0     0   247k      0  0:01:07  0:01:07 --:--:--  176k
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ chmod +x docker-compose
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ ./docker-compose --version
docker-compose version 1.25.0, build 0a186604
```

__Start up__

For example
```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ ./docker-compose -p nebroad-test up -d
Creating network "nebroad-test_default" with the default driver
Creating volume "nebroad-test_cache-data" with default driver
Pulling mysql (mysql:5.7.28)...
5.7.28: Pulling from library/mysql
804555ee0376: Pull complete
c53bab458734: Pull complete
ca9d72777f90: Pull complete
2d7aad6cb96e: Pull complete
8d6ca35c7908: Pull complete
6ddae009e760: Pull complete
327ae67bbe7b: Pull complete
31f1f8385b27: Pull complete
a5a3ad97e819: Pull complete
48bede7828ac: Pull complete
380afa2e6973: Pull complete
Digest: sha256:b38555e593300df225daea22aeb104eed79fc80d2f064fde1e16e1804d00d0fc
Status: Downloaded newer image for mysql:5.7.28
Pulling redis (redis:4.0.14)...
4.0.14: Pulling from library/redis
8ec398bc0356: Pull complete
da01136793fa: Pull complete
cf1486a2c0b8: Pull complete
640dac823a22: Pull complete
0537d38061d8: Pull complete
0d3168bee284: Pull complete
Digest: sha256:1b670b3111b938895448ae69fc2ea2e2614e8ddba1f0ec9a52d2bef49b728f49
Status: Downloaded newer image for redis:4.0.14
Creating nebroad-test_mysql_1  ... done
Creating nebroad-test_webapp_1 ... done
Creating nebroad-test_redis_1  ... done
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ docker network ls -f name=nebroad-test
NETWORK ID          NAME                   DRIVER              SCOPE
fc7dd3d2e48e        nebroad-test_default   bridge              local
```

```
vagrant@ubuntu-bionic:/Users/fanhongling/Downloads/workspace/src/github.com/stackdocker/container-ops/superviosr-springboot-redis-mysql$ ./docker-compose -p nebraod-test ps
        Name                       Command                State                   Ports              
-----------------------------------------------------------------------------------------------------
nebraod-test_mysql_1    docker-entrypoint.sh mysqld      Up         0.0.0.0:3306->3306/tcp, 33060/tcp
nebraod-test_redis_1    docker-entrypoint.sh redis ...   Up         0.0.0.0:6379->6379/tcp                                   
nebraod-test_webapp_1   /springboot/run.sh               Up         0.0.0.0:14780->8080/tcp          
```

__More__


```
$ ./docker-compose --help
```
