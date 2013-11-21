# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

box         = "centos63"
url         = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.3-x86_64-v20130101.box"
hostname    = "dev"
domain      = "local.box"
ram         = "256"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "dev.local"

  config.vm.box = box
  config.vm.box_url = url
  config.vm.host_name = hostname + "." + domain
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--name", hostname,
      "--memory", ram
    ]
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = "modules"
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "default.pp"
    puppet.facter = {
      'fqdn' => config.vm.host_name,
    }
  end
end
