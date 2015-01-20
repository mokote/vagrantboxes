clean:
	rm -rf *.box output-*

ubuntu: ubuntu-12.04.json
	packer validate $<
	packer build $<

ubuntu-vmware: ubuntu-12.04.json
	packer validate $<
	packer build -only=vmware-iso $<

ubuntu-virtualbox: ubuntu-12.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<


debian: debian-7.json
	packer validate $<
	packer build $<

debian-vmware: debian-7.json
	packer validate $<
	packer build -only=vmware-iso $<

debian-virtualbox: debian-7.json
	packer validate $<
	packer build -only=virtualbox-iso $<


.PHONY: clean
