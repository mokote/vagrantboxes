clean:
	rm -rf *.box output-*

vmware: ubuntu-12.04.json clean
	packer validate $<
	packer build -only=vmware $<
	vagrant box remove ubuntu1204-test
	vagrant box add ubuntu1204-test ubuntu-12.04-server-amd64-vmware.box

