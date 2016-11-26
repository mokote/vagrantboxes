Mokote Vagrant Boxes
====================

We're using Vagrant actively, that's why we've got our own templates for Packer to generate virtual boxes on demand.

All boxes have virtual machine guest tools preinstalled to provide seamless integration with the host machine.

Feel free to send us any feedback here or file an issue.


Available Boxes
---------------

* [Ubuntu 16.04.1 for VirtualBox](https://mokote.com/vagrantboxes/ubuntu-16.04.1-amd64-virtualbox.box) (594M)
* [Debian 8.6.0 Jessie for VirtualBox](https://mokote.com/vagrantboxes/debian-8.6.0-amd64-virtualbox.box) (542M)


Usage
-----

    vagrant box add debian-8 http://mokote.com/vagrantboxes/debian-8.6.0-amd64-virtualbox.box

or

    vagrant box add mokote/debian-8


See [Vagrant documentation](http://docs.vagrantup.com/v2/boxes.html) for more details.


Our boxes on Vagrant Atlas: [atlas.hashicorp.com/mokote/](https://atlas.hashicorp.com/mokote/)
