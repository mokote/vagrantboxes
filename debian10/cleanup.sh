# Remove unused packages
apt autoremove

# Removing leftover leases and persistent rules
if [ -d "/var/lib/dhcp" ]; then
    echo "cleaning up dhcp leases"
    rm /var/lib/dhcp/*
fi

# Make sure Udev doesn't block our network
echo "cleaning up udev rules"
rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

# Zero out the free space to save space in the final image:
echo "Zeroing device to make space..."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

#Clean up tmp
rm -rf /tmp/*

# Sync disk
sync
