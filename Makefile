SHELL=/bin/bash
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MAKEFILE_DIR))))
DIR=$(MAKEFILE_DIR)
PWD:=$(shell pwd)
PKG:=main
VERSION_FLAG_INFO:=-X $(PKG).Version=$(shell cat .version) -X $(PKG).Build=$$(date -u +%Y.%m.%d.%H.%M.%S.%:::z) -X $(PKG).Commit=$$(git log --format=%h-%aI -n1)


all: qrauth

qrauth: serve.go auth.go version.go
	echo $(VERSION_FLAG_INFO)
	go build -tags netgo -ldflags "$(VERSION_FLAG_INFO)" -o $@ $^
