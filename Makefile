default: targets


targets:
	@echo "Known targets:"
	@grep -e '^\w' Makefile | grep ':' | cut -d: -f1 | grep -v default | grep -v targets
	@echo


clean:
	rm -rf *.box output-*
	rm -rf packer_cache


# Ubuntu Server
ubuntu1604: ubuntu1604-amd64-virtualbox.box

ubuntu1604-test: ubuntu1604-amd64-virtualbox.box
	./testbox.sh $<

ubuntu1604-amd64-virtualbox.box: ubuntu1604.json
	packer validate $<
	packer build -only=virtualbox-iso $<


# Debian
debian9: debian9-amd64-virtualbox.box

debian9-test: debian9-amd64-virtualbox.box
	./testbox.sh $<

debian9-amd64-virtualbox.box: debian9.json
	packer validate $<
	packer build -only=virtualbox-iso $<


.PHONY: clean debian9 debian9-test ubuntu1604 ubuntu1604-test
