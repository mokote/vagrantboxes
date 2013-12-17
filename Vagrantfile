# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu1204-test"

     # Forward Tornado's 9000
#    config.vm.network :forwarded_port, guest:9000, host:9000

    config.vm.provider :vmware_fusion do |fusion|
      fusion.vmx["memsize"] = "2048"
      fusion.vmx["numvcpus"] = "1"
    end

    config.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "2048"]
    end

#    config.vm.provision :ansible do |ansible|
#      ansible.verbose = 'v'
#      ansible.inventory_path = ENV['HOME'] + "/Projects/vitrina/vagrant/hosts_vagrant"
#      ansible.playbook = ENV['HOME'] + "/Projects/vitrina/vagrant/initial-setup.yaml"
#    end

end
