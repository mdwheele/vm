INSTALL/UPGRADE VM
==================

- install or update Vagrant & Virtual Box

    
    > git clone git@github.com:mdwheele/vm.git
    
    > vagrant plugin install vagrant-vbguest
    
    Update your dotfiles in your own `~` directory 
    
    Update the `config.dist.yaml` file as needed (primarily memory and shared files location)  There is no longer a merge between config files.
    
    > vagrant up
        installs the centos box 
        yum install of packages
        blah blah blah
    
