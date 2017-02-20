rmi: stop-test
	docker rmi sinopia 2>&1 > /dev/null

build:
	docker build -t sinopia:latest .

start-test: stop-test build
	docker run -p 4873:4873 --name sinopia -v /home/docker/sinopia:/opt/sinopia/storage sinopia:latest
	docker logs sinopia

stop-test:
	-docker rm -f sinopia 2>&1 > /dev/null

test: build
	docker run --rm -i -t sinopia:latest

shell: build
	docker run --rm -i -t sinopia:latest /bin/bash

logs:
	docker logs sinopia

publish:
	docker push sinopia:latest

test: start-test
