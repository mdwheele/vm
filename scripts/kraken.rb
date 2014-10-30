class Kraken
    def initialize(config, settings)
        # Configure the virtual machine
        config.vm.box = "centos65"
        config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
        config.vm.hostname = "kraken"

        config.vm.boot_timeout = 300

        # Configure a private network and port forwarding to machine...
        config.vm.network :private_network, ip: settings["ip"] ||= "192.168.33.10"
        config.vm.network :forwarded_port, guest: 80, host: settings["ports"]["http"] ||= 8000, host_ip: "127.0.0.1"
        config.vm.network :forwarded_port, guest: 443, host: settings["ports"]["https"] ||= 4430, host_ip: "127.0.0.1"

        # Configure VirtualBox settings...
        config.vm.provider "virtualbox" do |vb|
            vb.customize ["modifyvm", :id, "--memory", settings["memory"] ||= "2048"]
            vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        end

        # Configure SSH keys...
        config.vm.provision "shell" do |s|
            s.inline = "echo $1 | tee -a /home/vagrant/.ssh/authorized_keys"
            s.args = [File.read(File.expand_path(settings["authorize"]))]
        end

        settings["keys"].each do |key|
            config.vm.provision "shell" do |s|
                s.privileged = false
                s.inline = "echo \"$1\" > /home/vagrant/.ssh/$2 && chmod 600 /home/vagrant/.ssh/$2"
                s.args = [File.read(File.expand_path(key)), key.split('/').last]
            end
        end

        # Register shared folders...
        settings["folders"].each do |folder|
            config.vm.synced_folder folder["map"], folder["to"], type: folder["with"] ||= nil, mount_options: folder["options"] ||= nil, :bsd__nfs_options => ["-maproot=0:0"]
        end

        # Install Ruby 1.9.3... CentOS hate hate hate...
        config.vm.provision :shell, :path => "scripts/install-ruby.sh"

        # Run Librarian Puppet...
        config.vm.provision :shell, :path => "scripts/run-librarian-puppet.sh"

        # Remove Git... to be replaced with 1.9.0
        # This is removed as mitigation pain going from 1.7.1 -> 1.9.0
        config.vm.provision "shell" do |s|
            s.inline = "yum remove git -y >/dev/null"
        end

        config.vm.provision :puppet do |puppet|
            puppet.module_path = [ "puppet/modules", "puppet/modules-contrib" ]
            puppet.manifests_path = "puppet/manifests"
            puppet.manifest_file  = "site.pp"
            puppet.options = "--hiera_config /vagrant/hiera.yaml"
        end

        config.vm.provision :shell, :path => "scripts/update.sh"
    end
end
