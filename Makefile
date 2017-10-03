CRYSTAL_BIN ?= $(shell which crystal)
NOTEESH_BIN ?= $(shell which noteesh)
PREFIX ?= /usr/local

build:
	mkdir -p ./bin
	$(CRYSTAL_BIN) build --release --no-debug -o bin/noteesh src/noteesh.cr $(CRFLAGS)
clean:
	rm -f ./bin/noteesh
compile:
	$(CRYSTAL_BIN) build -d -o bin/noteesh src/noteesh.cr $(CRFLAGS)
test: build
	$(CRYSTAL_BIN) spec
install: build
	mkdir -p $(PREFIX)/bin
	cp ./bin/noteesh $(PREFIX)/bin
reinstall: build
	cp ./bin/noteesh $(NOTEESH_BIN) -rf
