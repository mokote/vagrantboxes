# Tweak sshd to prevent DNS resolution (speed up logins).
echo 'UseDNS no' >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config # Speed up the login process

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

# Add vagrant to the "sudo" group to allow no-password mode for vagrant.
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
usermod -a -G sudo vagrant

# Install software for the base box to come packaged with.
apt-get -y --force-yes update
aptitude -y safe-upgrade
apt-get install --no-install-recommends -y bzip2 curl less mc psmisc strace sudo unzip vim-nox whois zip
