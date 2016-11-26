apt-get install -y --no-install-recommends dkms make

# Uncomment this if you want to install Guest Additions with support for X
#sudo apt-get -y install xserver-xorg

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
VBOX_ISO=VBoxGuestAdditions_$VBOX_VERSION.iso

mount -o loop,ro $VBOX_ISO /mnt/
/mnt/VBoxLinuxAdditions.run || :
umount /mnt/
rm -f $VBOX_ISO

if [ "$VBOX_VERSION" == '4.3.10' ]; then
  # https://www.virtualbox.org/ticket/12879
  ln -s "/opt/VBoxGuestAdditions-$VBOX_VERSION/lib/VBoxGuestAdditions" /usr/lib/VBoxGuestAdditions
fi
