default: targets


targets:
	@echo "Known targets:"
	@grep -e '^\w' Makefile | grep ':' | cut -d: -f1 | grep -v default | grep -v targets
	@echo


clean:
	rm -rf *.box output-*
	rm -rf packer_cache


ubuntu1604: ubuntu-16.04.json
	packer validate $<
	packer build -only=virtualbox-iso $<

ubuntu1604-test: ubuntu-16.04.1-amd64-virtualbox.box
	./testbox.sh $<


debian8: debian-8.json
	packer validate $<
	packer build -only=virtualbox-iso $<

debian8-test: debian-8.*-amd64-virtualbox.box
	./testbox.sh $<


.PHONY: clean
