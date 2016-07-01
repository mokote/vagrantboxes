#!/bin/sh -eux

echo 1
sudo apt-get -y --yes install dkms
echo 2
sudo apt-get -y --yes install make
echo 3

# Uncomment this if you want to install Guest Additions with support for X
#sudo apt-get -y install xserver-xorg

echo 4
sudo mount -o loop,ro ~/VBoxGuestAdditions.iso /mnt/
sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
echo 5

VBOX_VERSION=$(cat ~/.vbox_version)
if [ "$VBOX_VERSION" == '4.3.10' ]; then
  # https://www.virtualbox.org/ticket/12879
  sudo ln -s "/opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions" /usr/lib/VBoxGuestAdditions
fi

echo 6
