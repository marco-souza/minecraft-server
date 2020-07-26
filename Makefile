all: build

build: docker-compose.yml config
	mkdir data
	docker-compose
