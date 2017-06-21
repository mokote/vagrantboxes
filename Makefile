default: targets


targets:
	@echo "Known targets:"
	@grep -e '^\w' Makefile | grep ':' | cut -d: -f1 | grep -v default | grep -v targets
	@echo


clean:
	rm -rf *.box output-*
	rm -rf packer_cache


# Debian 9 "Stretch"
debian9: debian9-amd64-virtualbox.box

debian9-test: debian9-amd64-virtualbox.box
	./testbox.sh $<

debian9-amd64-virtualbox.box: debian9.json
	packer validate $<
	packer build -only=virtualbox-iso $<


# Ubuntu Server 16.04
ubuntu1604: ubuntu1604-amd64-virtualbox.box

ubuntu1604-test: ubuntu1604-amd64-virtualbox.box
	./testbox.sh $<

ubuntu1604-amd64-virtualbox.box: ubuntu1604.json
	packer validate $<
	packer build -only=virtualbox-iso $<


# Ubuntu Server 17.04
ubuntu1704: ubuntu1704-amd64-virtualbox.box

ubuntu1704-test: ubuntu1704-amd64-virtualbox.box
	./testbox.sh $<

ubuntu1704-amd64-virtualbox.box: ubuntu1704.json
	packer validate $<
	packer build -only=virtualbox-iso $<


.PHONY: clean debian9 debian9-test ubuntu1604 ubuntu1604-test
