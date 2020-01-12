
clean:
	rm -f *.rpm docker-compose
	
download:
	yum install --downloadonly --downloaddir=. docker
	curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o ../docker-compose
	
install:
	sudo rpm -Uvh *.rpm
	sudo cp docker-compose /usr/local/bin