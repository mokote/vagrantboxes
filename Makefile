clean:
	rm -rf *.box output-*

ubuntu: ubuntu-12.04.json
	packer validate $<
	packer build $<

ubuntu-vmware: ubuntu-12.04.json
	packer validate $<
	packer build -only=vmware-iso $<
	# vagrant box remove ubuntu12044 vmware_desktop
	# vagrant box add ubuntu12044 ubuntu-12.04.4-amd64-vmware.box

ubuntu-virtualbox: ubuntu-12.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<
	# vagrant box remove ubuntu12044 virtualbox
	# vagrant box add ubuntu12044 ubuntu-12.04.4-amd64-virtualbox.box


debian: debian-7.json
	packer validate $<
	packer build $<

debian-vmware: debian-7.json
	packer validate $<
	packer build -only=vmware-iso $<
	# vagrant box remove debian740 vmware_desktop
	# vagrant box add debian740 debian-7.4.0-amd64-vmware.box

debian-virtualbox: debian-7.json
	packer validate $<
	packer build -only=virtualbox-iso $<
	# vagrant box remove debian740 virtualbox
	# vagrant box add debian740 debian-7.4.0-amd64-virtualbox.box


.PHONY: clean