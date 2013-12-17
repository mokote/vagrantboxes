# Install the Linux headers
apt-get -y --force-yes install gcc build-essential linux-headers-$(uname -r)

# Install the VMware Fusion guest tools
cd /tmp
mkdir -p /mnt/cdrom
mount -o loop ~/linux.iso /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
/tmp/vmware-tools-distrib/vmware-install.pl -d
rm /home/vagrant/linux.iso
umount /mnt/cdrom
rmdir /mnt/cdrom

# Remove packages used for building, since they aren't needed anymore
apt-get -y --force-yes remove gcc build-essential linux-headers-$(uname -r)
