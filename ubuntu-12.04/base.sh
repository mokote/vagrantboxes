#!/bin/bash

date > /etc/packer_build_time

# Tweak sshd to prevent DNS resolution (speed up logins).
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting.
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US cgroup_enable=memory swapaccount=1"
EOF

update-grub

# Add vagrant to the "sudo" group to alow no-password mode for vagrant.
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
usermod -a -G sudo vagrant

# Install software for the base box to come packaged with.
apt-get -y --force-yes update
aptitude -y safe-upgrade
apt-get install -y sudo less vim-nox tcpdump tcpflow curl mc psmisc zip unzip bzip2 openssh-server whois strace

# install the backported kernel
apt-get update
apt-get install -y linux-image-generic-lts-raring linux-headers-generic-lts-raring

# reboot
echo "Rebooting the machine..."
reboot
sleep 60