# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

box         = "ncsu-centos64"
url         = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
hostname    = "local.dev.box"
ram         = "256"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.box = box
    config.vm.box_url = url
    config.vm.hostname = hostname

    config.vm.network :private_network, ip: "192.168.33.10"
    config.vm.network :forwarded_port, guest: 80, host: 8080

    config.ssh.forward_agent = true

    config.vm.provider :virtualbox do |vb|
        vb.customize [
            "modifyvm", :id,
            "--memory", ram
        ]
    end

    config.vm.provision :puppet do |puppet|
        puppet.module_path = "modules"
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "site.pp"
        puppet.options = "--hiera_config hiera.yaml"
    end
end
