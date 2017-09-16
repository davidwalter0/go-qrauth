SHELL=/bin/bash
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
CURRENT_DIR := $(notdir $(patsubst %/,%,$(dir $(MAKEFILE_DIR))))
DIR=$(MAKEFILE_DIR)

PWD:=$(shell pwd)
PKG:=$(shell basename $(PWD))
VERSION_FLAG_INFO:=-s -w -X $(PKG).VersionText=$(shell cat .version) -X $(PKG).Build=$$(date -u +%Y.%m.%d.%H.%M.%S.%:::z) -X $(PKG).Commit=$$(git log --format=%h-%aI -n1)

all:
	echo $(VERSION_FLAG_INFO)
	go build -tags netgo -ldflags "-w -s $(VERSION_FLAG_INFO)" -o qr-auth serve.go auth.go version.go


######## # makefile home directory
######## .SILENT:
######## DIR=$(abspath $(dir $(realpath $(firstword $(MAKEFILE_LIST)))))
######## WHICH=$(realpath $(firstword $(MAKEFILE_LIST)))

######## all:
######## 	make -C ${DIR} _all

######## _all: 
######## 	go build -tags netgo -ldflags '-w -s' -o serve serve.go auth.go


######## clean:
######## 	make -C ${DIR} _clean

######## _clean:
######## 	rm -f ${DIR}/*.png
