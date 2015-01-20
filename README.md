Mokote Vagrant Boxes
====================

We're using Vagrant actively, that's why we do have our own templates for Packer to generate virtual boxes on demand.

All boxes have virtual machine guest tools preinstalled to provide seamless integration with the host machine.

Feel free to send us any feedback here or file an issue.


Boxes Available
---------------

VirtualBox:
* [Ubuntu 12.04.4 for VirtualBox](http://mokote.com/vagrantboxes/ubuntu-12.04.4-amd64-virtualbox.box) (572M)
* [Debian 7.8 Wheezy for VirtualBox](http://mokote.com/vagrantboxes/debian-7.8.0-amd64-virtualbox.box) (348M)


Usage
-----

    vagrant box add debian7 http://mokote.com/vagrantboxes/debian-7.8.0-amd64-virtualbox.box

or
 
    vagrant box add mokote/debian-7


See [Vagrant documentation](http://docs.vagrantup.com/v2/boxes.html) for more details.


Our boxes on VagrantCloud: [vagrantcloud.com/mokote](https://vagrantcloud.com/mokote/)
