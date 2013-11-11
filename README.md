Mokote Vagrant Boxes
====================

We're using Vagrant actively, that's why we do have our own templates for Packer to generate virtual boxes on demand.

Only Vagrant boxes for VMWare Fusion are provided so far. When boxes for VirtualBox are ready, they will be published as well.

All boxes have virtual machine guest tools preinstalled to provide seamless integration with the host machine.

Feel free to send us any feedback here or file an issue.


Boxes Available
---------------
* [Ubuntu 12.04.3 for VMWare](http://mokote.com/vagrantboxes/ubuntu-12.04.3-amd64-vmware.box) (641M)
* [Debian 7.2.0 Wheezy for VMWare](http://mokote.com/vagrantboxes/debian-7.2.0-amd64-vmware.box) (456M)


Usage
-----

    vagrant box add ubuntu1204 http://mokote.com/vagrantboxes/ubuntu-12.04.3-amd64-vmware.box

    vagrant box add debian7 http://mokote.com/vagrantboxes/debian-7.2.0-amd64-vmware.box

