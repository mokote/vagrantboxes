clean:
	rm -rf *.box output-*

ubuntu1204: ubuntu-12.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<


ubuntu1604: ubuntu-16.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<

debian7: debian-7.json
	packer validate $<
	packer build -only=virtualbox-iso $<

debian8: debian-8.json
	packer validate $<
	packer build -only=virtualbox-iso $<

.PHONY: clean
