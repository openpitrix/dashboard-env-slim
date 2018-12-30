.PHONY: build

build: Dockerfile
	docker build -t op/dash-env-slim .
