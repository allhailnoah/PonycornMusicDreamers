SHELL := /bin/bash

all: build

build:
	moonc *.moon
