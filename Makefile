ARCH="`uname -s`"
LINUX="Linux"
Darwin="Darwin"

HOST=registry.cn-shanghai.aliyuncs.com/publish-kj
REPO=debug
VERSION=$(shell cat version)

TARGET_IMAGE=$(HOST)/$(REPO):$(VERSION)


mod:
	export GO111MODULE=on
	go mod tidy
	go mod download


build: mod
	@if [ $(ARCH) = $(LINUX) ]; \
    	then \
    		go build -o debug -tags 'netgo osusergo' -ldflags '-extldflags "-static"' main.go; \
    	elif [ $(ARCH) = $(Darwin) ]; \
    	then \
    		GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o debug -ldflags '-s -extldflags "-sectcreate __TEXT __info_plist Info.plist"' main.go; \
    	else \
    		echo "ARCH unknow"; \
    	fi

images: build
	docker build -t $(TARGET_IMAGE) .

push: images
	docker push $(TARGET_IMAGE)