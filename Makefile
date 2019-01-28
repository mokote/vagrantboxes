default: help

.PHONY: help
help:
	@echo "Known targets:"
	@grep -e '^\w' Makefile | grep ':' | cut -d: -f1 | grep -v default | grep -v targets
	@echo

.PHONY: clean
clean:
	rm -rf *.box output-*
	rm -rf packer_cache


# Debian 9 "Stretch"
export DEBIAN_9_VERSION=9.7.0

.PHONY: debian9
debian9: debian$(DEBIAN_9_VERSION)-amd64-virtualbox.box

.PHONY: debian9-test
debian9-test: debian$(DEBIAN_9_VERSION)-amd64-virtualbox.box
	./testbox.sh $<

debian$(DEBIAN_9_VERSION)-amd64-virtualbox.box: debian9.json
	packer validate $<
	packer build -only=virtualbox-iso $<


# Ubuntu Server 16.04
export UBUNTU_1604_VERSION=16.04.5

.PHONY: ubuntu1604
ubuntu1604: ubuntu$(UBUNTU_1604_VERSION)-amd64-virtualbox.box

.PHONY: ubuntu1604-test
ubuntu1604-test: ubuntu$(UBUNTU_1604_VERSION)-amd64-virtualbox.box
	./testbox.sh $<

ubuntu$(UBUNTU_1604_VERSION)-amd64-virtualbox.box: ubuntu1604.json
	packer validate $<
	packer build -only=virtualbox-iso $<


# Ubuntu Server 18.04
export UBUNTU_1804_VERSION=18.04.1.0

.PHONY: ubuntu1804
ubuntu1804: ubuntu$(UBUNTU_1804_VERSION)-amd64-virtualbox.box

.PHONY: ubuntu1804-test
ubuntu1804-test: ubuntu$(UBUNTU_1804_VERSION)-amd64-virtualbox.box
	./testbox.sh $<

ubuntu$(UBUNTU_1804_VERSION)-amd64-virtualbox.box: ubuntu1804.json
	packer validate $<
	packer build -only=virtualbox-iso $<
