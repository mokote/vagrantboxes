#!/bin/bash

# Install the Linux headers
apt-get -y --force-yes install gcc build-essential linux-headers-$(uname -r)

# Install the VMware Fusion guest tools
VMTOOLS=/home/vagrant/linux.iso
cd /tmp
mkdir -p /mnt/cdrom
mount -o loop $VMTOOLS /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
/tmp/vmware-tools-distrib/vmware-install.pl -d
rm $VMTOOLS
umount /mnt/cdrom
rmdir /mnt/cdrom

# Remove items used for building, since they aren't needed anymore
apt-get -y --force-yes remove linux-headers-$(uname -r) build-essential gcc
