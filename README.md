Mokote Vagrant Boxes
====================

We're using Vagrant actively, that's why we do have our own templates for Packer to generate virtual boxes on demand.

All boxes have virtual machine guest tools preinstalled to provide seamless integration with the host machine.

Feel free to send us any feedback here or file an issue.


Boxes Available
---------------

VMWare:
* [Ubuntu 12.04.4 for VMWare](http://mokote.com/vagrantboxes/ubuntu-12.04.4-amd64-vmware.box) (852M)
* [Debian 7.4.0 Wheezy for VMWare](http://mokote.com/vagrantboxes/debian-7.4.0-amd64-vmware.box) (489M)

VirtualBox:
* [Ubuntu 12.04.4 for VirtualBox](http://mokote.com/vagrantboxes/ubuntu-12.04.4-amd64-virtualbox.box) (572M)
* [Debian 7.4.0 Wheezy for VirtualBox](http://mokote.com/vagrantboxes/debian-7.4.0-amd64-virtualbox.box) (339M)


Usage
-----

    vagrant box add ubuntu1204 http://mokote.com/vagrantboxes/ubuntu-12.04.3-amd64-vmware.box

See [Vagrant documentation](http://docs.vagrantup.com/v2/boxes.html) for more details.
