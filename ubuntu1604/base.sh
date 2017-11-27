# Tweak sshd to prevent DNS resolution (speed up logins).
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Disable daily apt unattended updates.
echo 'APT::Periodic::Enable "0";' >> /etc/apt/apt.conf.d/10periodic

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

# Install software for the base box to come packaged with.
apt-get -y --force-yes update
aptitude -y safe-upgrade
apt-get install --no-install-recommends -y sudo less curl mc psmisc zip unzip bzip2 whois strace vim-nox

# Add vagrant to the "sudo" group to alow no-password mode for vagrant.
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
usermod -a -G sudo vagrant
