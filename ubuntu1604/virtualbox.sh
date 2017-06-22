# Install the Linux headers
apt-get -y --force-yes install gcc build-essential linux-headers-$(uname -r)

# Install the VirtualBox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso
mount -o loop $VBOX_ISO /mnt
yes|sh /mnt/VBoxLinuxAdditions.run
umount /mnt

#Cleanup VirtualBox
rm $VBOX_ISO

# Remove packages used for building, since they aren't needed anymore
apt-get -y --force-yes remove gcc build-essential linux-headers-$(uname -r)
