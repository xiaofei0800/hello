
# init project path
WORKROOT := $(shell pwd)
OUTDIR   := $(WORKROOT)/output

# init environment variables
export GOPATH      := $(WORKROOT)/../../../../
export PATH        := $(GOPATH)/bin:$(PATH)
export GO111MODULE := on

# init command params
GO      := go
GOBUILD := $(GO) build
GOTEST  := $(GO) test
GOVET   := $(GO) vet
GOGET   := $(GO) get
GOGEN   := $(GO) generate
GOCLEAN := $(GO) clean

# make, make all
all: compile package


# make compile, go build
compile: build
build:
	$(GOBUILD)

# make test, test your code
test: vet-case
vet-case:
	${GOVET} ./...
	
# make package
package:
	mkdir -p $(OUTDIR)/bin
	mv hello  $(OUTDIR)/bin

# make clean
clean:
	$(GOCLEAN)
	rm -rf $(OUTDIR)
	rm -rf $(GOPATH)/pkg/linux_amd64

# avoid filename conflict and speed up build 
.PHONY: all compile test package clean build
