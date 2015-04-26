# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "test"

    config.vm.provider :vmware_fusion do |fusion|
      fusion.vmx["memsize"] = "2048"
      fusion.vmx["numvcpus"] = "1"
    end

    config.vm.provider :virtualbox do |vbox|
        vbox.customize ["modifyvm", :id, "--memory", "2048"]
    end

end
