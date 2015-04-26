apt-get install -y ca-certificates # Needed for authorized_keys to work

# Installing vagrant keys
mkdir /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chmod 700 /home/vagrant/.ssh
chown -R vagrant /home/vagrant/.ssh
