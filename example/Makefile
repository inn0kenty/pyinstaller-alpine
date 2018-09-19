SHELL := /bin/bash


# TODO: change it
PROJECT := example
PYTHON_BIN := $(VIRTUAL_ENV)/bin
# TODO: change it
DOCKER_REGISTRY := example

# If you nedd add some PyInstaller hooks (https://pythonhosted.org/PyInstaller/hooks.html)
# create hooks dir and add to PYINSTALLER_OPTIONS key --additional-hooks-dir=hooks

PYINSTALLER_OPTIONS := \
		--noconfirm \
		--clean \
		--onefile \
		--name app \
		example.py

VERSION := $(shell cat example.py | grep __version__ | awk '{print $$3}' | tr -d "\"")

clean:
	-rm -r dist build *.spec

build_local:
	pyinstaller $(PYINSTALLER_OPTIONS)

build:
	docker build --pull --build-arg PYINSTALLER_ARG="$(PYINSTALLER_OPTIONS)" \
		-t $(DOCKER_REGISTRY)/$(PROJECT):latest \
		-t $(DOCKER_REGISTRY)/$(PROJECT):$(VERSION) .

push:
	docker push $(DOCKER_REGISTRY)/$(PROJECT):$(VERSION)
	docker push $(DOCKER_REGISTRY)/$(PROJECT):latest
