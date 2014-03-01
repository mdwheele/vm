class dotfiles {

    exec { "dotfiles" :
        cwd     => "/home/vagrant",
        command => "cp -r /vagrant/files/dotfiles/.[a-zA-Z0-9]* /home/vagrant/ \
                    && chown -R vagrant /home/vagrant/.[a-zA-Z0-9]*",
        onlyif  => 'test -d /vagrant/files/dotfiles',
        returns => [0, 1]
    }

}