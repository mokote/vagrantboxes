Mokote Vagrant Boxes
====================

We're using Vagrant actively, that's why we do have our own templates for Packer to generate virtual boxes on demand.

All boxes have virtual machine guest tools preinstalled to provide seamless integration with the host machine.

Feel free to send us any feedback here or file an issue.


Boxes Available
---------------

* [Debian 8.1 Jessie for VirtualBox](https://mokote.com/vagrantboxes/debian-8.1.0-amd64-virtualbox.box) (486M)
* [Debian 7.8 Wheezy for VirtualBox](https://mokote.com/vagrantboxes/debian-7.8.0-amd64-virtualbox.box) (348M)
* [Ubuntu 12.04.4 for VirtualBox](https://mokote.com/vagrantboxes/ubuntu-12.04.4-amd64-virtualbox.box) (572M)
* [Ubuntu 16.04 for VirtualBox](https://mokote.com/vagrantboxes/ubuntu-16.04-amd64-virtualbox.box) (589M)

Usage
-----

    vagrant box add debian-8 http://mokote.com/vagrantboxes/debian-8.0.0-amd64-virtualbox.box

or

    vagrant box add mokote/debian-8


See [Vagrant documentation](http://docs.vagrantup.com/v2/boxes.html) for more details.


Our boxes on Vagrant Atlas: [atlas.hashicorp.com/mokote/](https://atlas.hashicorp.com/mokote/)
