INSTALL/UPGRADE VM
==================

- install or update Vagrant & Virtual Box

    
    > git clone git@github.com:mdwheele/vm.git
    
    > vagrant plugin install vagrant-vbguest
    
    Update your dotfiles in the `files/dotfiles` directory.  They will be included on provision.
    
    Update the `config.yaml` file, only the settings that you need to overwrite.
    
    > vagrant up
        installs the centos box 
        yum install of packages
        blah blah blah
    
