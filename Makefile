SHELL := /bin/bash

swagger:
	swagger generate spec -o ./swagger.json
	swagger serve ./swagger.json

.PHONY: test