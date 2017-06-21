# Remove unused packages
apt-get -y autoremove

# Delete all Linux headers
dpkg --list | awk '{ print $2 }' | grep 'linux-headers' | xargs apt-get -y purge

# Remove specific Linux kernels, such as linux-image-3.11.0-15-generic but
# keeps the current kernel and does not touch the virtual packages,
# e.g. 'linux-image-generic', etc.
dpkg --list | awk '{ print $2 }' | grep 'linux-image-3.*-generic' | grep -v `uname -r` | xargs apt-get -y purge

# Delete Linux source
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge

# Delete development packages
dpkg --list | awk '{ print $2 }' | grep -- '-dev$' | xargs apt-get -y purge

# Delete X11 libraries
apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6

# Delete obsolete networking
apt-get -y purge ppp pppconfig pppoeconf

# Delete oddities
apt-get -y purge popularity-contest

apt-get -y autoremove
apt-get -y clean

rm -f VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

# Removing leftover leases and persistent rules
if [ -d "/var/lib/dhcp" ]; then
    echo "cleaning up dhcp leases"
    rm /var/lib/dhcp/*
fi

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

# Clean up tmp
rm -rf /tmp/*

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
