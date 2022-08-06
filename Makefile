SHELL := /bin/bash

swagger:
	swagger generate spec -o ./swagger.json
	swagger serve ./swagger.json

mongo:
	docker rm -f mongodb || true
	docker run -d --name mongodb -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password -p 27017:27017 mongo:4.4.3

run_server:
	MONGO_URI="mongodb://admin:password@localhost:27017/test?authSource=admin" \
	MONGO_DATABASE=test \
	go run .

.PHONY: test