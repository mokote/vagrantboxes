#!/bin/sh -eux

sudo apt-get -y install --no-install-recommends dkms
sudo apt-get -y install --no-install-recommends make

# Uncomment this if you want to install Guest Additions with support for X
#sudo apt-get -y install xserver-xorg

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso

sudo mount -o loop,ro $VBOX_ISO /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f $VBOX_ISO

if [ "$VBOX_VERSION" == '4.3.10' ]; then
  # https://www.virtualbox.org/ticket/12879
  sudo ln -s "/opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions" /usr/lib/VBoxGuestAdditions
fi
