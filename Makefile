BOX_URL ?= https://github.com/humbug/box/releases/download/3.0.0-beta.4/box.phar

DOCKER_CMD ?= docker
IMAGE_NAME ?= patrickjahns/box:latest

BUILD_VERSION ?= latest
BUILD_DATE ?= $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')

VCS_REF ?= $(shell git rev-parse HEAD)
VCS_URL ?= $(shell git remote get-url origin)

.PHONY: build
build:
	$(DOCKER_CMD) build --label org.label-schema.version=$(BUILD_VERSION) --label org.label-schema.build-date=$(BUILD_DATE) --label org.label-schema.vcs-url=$(VCS_URL) --label org.label-schema.vcs-ref=$(VCS_REF)  --build-arg BOX_URL=$(BOX_URL) -t $(IMAGE_NAME) .
