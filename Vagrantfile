require 'yaml'

dir = File.dirname(File.expand_path(__FILE__))

configValues = YAML.load_file("#{dir}/config.yaml")
data = configValues['vm-config']

Vagrant.configure("2") do |config|

    config.vm.box = "centos65"
    config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
    config.vm.hostname = "local.dev"

    config.vm.network :private_network, ip: "192.168.33.10"
    config.vm.network :forwarded_port, guest: 80, host: data['host']['http_port'] ||= 8080, host_ip: "127.0.0.1"
    config.vm.network :forwarded_port, guest: 443, host: data['host']['https_port'] ||= 8443, host_ip: "127.0.0.1"

	if data['synced_folder']['enabled']
		host_path = data['synced_folder']['host_path'] ||= "~/Sites"
		guest_path = data['synced_folder']['guest_path'] ||= "/var/www/html"

	    config.vm.synced_folder host_path, guest_path, :mount_options => ["dmode=777","fmode=777"]
	end

    config.ssh.forward_agent = true

    config.vm.provider :virtualbox do |vm|
        vm.name = "local_dev_vm"
        vm.customize ["modifyvm", :id, "--memory", data['memory'] ||= "4096"]
        vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vm.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    config.vm.provision "shell" do |s|
        s.path = "shell/initial-setup.sh"
        s.args = "/vagrant"
    end

    config.vm.provision :puppet do |puppet|
        puppet.module_path = "puppet/modules"
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file  = "site.pp"
        puppet.options = "--hiera_config /vagrant/hiera.yaml"
    end

    config.vm.provision :shell, :path => "shell/update.sh"
end
