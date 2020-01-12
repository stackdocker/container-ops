
shell_cmd = /bin/bash
docker_cmd = $(shell which docker)
compose_cmd = $(shell which docker-compose)

ALL_IN_ONE_IMG_REPO ?= nebroad/demo
ALL_IN_ONE_CONTAINER ?= demo
ALL_IN_ONE_SUFFIX ?= .ubuntu

SPRINGBOOT_WEBAPP_IMGREPO ?= nebroad/test
IMGREPO_TOTAR ?= nebroad/test

uname_info = $(shell uname -a)

ifeq ($(findstring Ubuntu,$(uname_info)),Ubuntu)
  OFFLINE_PKG_DIR = deb-pkg
else ifeq ($(findstring el7.x86_64,$(uname_info)),el7.x86_64)
  OFFLINE_PKG_DIR = rpm-pkg
else
  OFFLINE_PKG_DIR =
endif

build-all-in-one:
	$(docker_cmd) build --force-rm --no-cache --rm -t $(ALL_IN_ONE_IMG_REPO) -f Dockerfile.all-in-one$(ALL_IN_ONE_SUFFIX) .
	
drop-all-in-one: 
	$(docker_cmd) rmi $(ALL_IN_ONE_IMG_REPO)
	
test-all-in-one:
	$(docker_cmd) volume create db-data
	$(docker_cmd) volume create cache-data
	$(docker_cmd) run -d -P \
	  --env "MYSQL_ROOT_PASSWORD=ROOT_PASSWORD!" \
	  --env "MYSQL_USER=demo" \
	  --env "MYSQL_PASSWORD=DEMO_PASSWORD" \
	  --env "MYSQL_DATABASE=demodb" \
	  --env "TZ=Asia/Shanghai" \
	  --volume "$(CURDIR)/db-init:/docker-entrypoint-initdb.d" \
	  --volume "db-data:/var/lib/mysql" \
	  --mount source=cache-data,target=/data \
	  --mount "type=bind,source=$(CURDIR)/webappdemo.war,target=/springboot/webapp.war" \
	  --name demo $(ALL_IN_ONE_IMG_REPO)
	@echo "waiting 5 seconds"
	@sleep 5
	@if [ -n "$(docker ps -aq -f status=exited -f name=demo 2> /dev/null)" ]; then \
	  echo "Container exited"; \
	  exit 1; \
	fi
	$(docker_cmd) exec -ti demo /bin/bash -c "supervisorctl status"; \
	
kill-all-in-one:
	$(docker_cmd) stop $(ALL_IN_ONE_CONTAINER)
	$(docker_cmd) rm $(ALL_IN_ONE_CONTAINER)
	$(docker_cmd) volume rm cache-data db-data

clean-all-in-one: kill-all-in-one drop-all-in-one

	
debug-all-in-one:
	$(docker_cmd) run --rm -ti \
	  --env "MYSQL_ROOT_PASSWORD=ROOT_PASSWORD!" \
	  --env "MYSQL_USER=demo" \
	  --env "MYSQL_PASSWORD=DEMO_PASSWORD" \
	  --env "MYSQL_DATABASE=demodb" \
	  --volume "$(CURDIR)/db-init:/docker-entrypoint-initdb.d" \
	  --volume "db-data:/var/lib/mysql" \
	  --mount source=cache-data,target=/data \
	  --mount "type=bind,source=$(CURDIR)/webappdemo.war,target=/springboot/webapp.war" \
	  --name demo-debug $(ALL_IN_ONE_IMG_REPO) /bin/bash


build-springboot-webapp:
	if [ -n "$($(docker_cmd) images -q $(SPRINGBOOT_WEBAPP_IMGREPO) 2> /dev/null)" ]; then \
	  $(docker_cmd) rmi $(SPRINGBOOT_WEBAPP_IMGREPO); \
	fi
	$(docker_cmd) build --force-rm --no-cache --rm \
	  --build-arg TARGET_ARCHIVE=/webappdemo.war \
	  --build-arg SPRING_DATASOURCE_URL=jdbc:mysql://mysql:3306/demodb \
	  --build-arg SPRING_DATASOURCE_USERNAME=demo \
	  --build-arg SPRING_DATASOURCE_PASSWORD=DEMO_PASSWORD \
	  --build-arg SPRING_REDIS_HOST=redis \
	  --build-arg SPRING_REDIS_PORT=6379 \
	  --build-arg SPRING_REDIS_DATABASE=0 \
	  --build-arg SPRING_CACHE_TYPE=NONE \
	  -t $(SPRINGBOOT_WEBAPP_IMGREPO) -f Dockerfile.springboot-webapp .

tarname=$(shell echo $(IMGREPO_TOTAR) | sed "s%/%_%g")
img-to-tar: $(tarname)
	$(docker_cmd) save -o "$(tarname).tar" $(IMGREPO_TOTAR)
	
tar-to-img: $(tarname)
	$(docker_cmd) load -i "$(tarname).tar"

compose:
	# @docker-compose -p nebroad-demo up -d
	@docker-compose up
	
prune:
	$(docker_cmd) system prune


work-offline-packages:
	@if [ -z $(OFFLINE_PKG_DIR) ]; then \
	  @echo "unknown package format"; \
	  exit 1; \
	fi
	@echo "new packages into" $(OFFLINE_PKG_DIR)
	$(MAKE) -C $(OFFLINE_PKG_DIR) download
	
install-offline-pkgs:
	$(MAKE) -C $(OFFLINE_PKG_DIR) install
	
.PHONY: build-all-in-one clean-all-in-one test-all-in-one debug-all-in-one kill-all-in-one free-all-in-one build-springboot-webapp img-to-tar tar-to-img compose prune get-docker-packages install-docker-pkgs