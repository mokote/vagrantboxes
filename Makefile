default: targets

targets:
	@echo "Known targets:"
	@grep -e '^\w' Makefile | grep ':' | cut -d: -f1 | grep -v default | grep -v targets
	@echo

clean:
	rm -rf *.box output-*

ubuntu1204: ubuntu-12.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<


ubuntu1604: ubuntu-16.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<

ubuntu1604-test: ubuntu-16.04-amd64-virtualbox.box
	vagrant box add --name test $<
	vagrant up
	-vagrant ssh
	vagrant destroy --force
	vagrant box remove --force test

debian7: debian-7.json
	packer validate $<
	packer build -only=virtualbox-iso $<

debian8: debian-8.json
	packer validate $<
	packer build -only=virtualbox-iso $<

.PHONY: clean
