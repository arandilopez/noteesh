CRYSTAL_BIN ?= $(shell which crystal)
NOTEESH_BIN ?= $(shell which noteesh)
PREFIX ?= /usr/local

all: clean build

build:
	mkdir -p ./bin
	$(CRYSTAL_BIN) build --release --no-debug -o bin/noteesh src/noteesh.cr $(CRFLAGS)
clean:
	rm -f ./bin/noteesh
compile: clean
	$(CRYSTAL_BIN) build -d -o bin/noteesh src/noteesh.cr $(CRFLAGS)
test: clean build
	$(CRYSTAL_BIN) spec
install: clean build
	mkdir -p $(PREFIX)/bin
	cp ./bin/noteesh $(PREFIX)/bin
reinstall: clean build
	cp -rf ./bin/noteesh $(PREFIX)/bin
uninstall:
	rm $(PREFIX)/bin/noteesh
