ARCH="`uname -s`"
LINUX="Linux"
Darwin="Darwin"

HOST=registry.cn-shanghai.aliyuncs.com/publish-kj
REPO=debug
VERSION=$(shell cat version)

TARGET_IMAGE=$(HOST)/$(REPO):$(VERSION)


images:
	docker build -t $(TARGET_IMAGE) .

push: images
	docker push $(TARGET_IMAGE)