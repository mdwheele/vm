class dotfiles::gitconfig {
    $gitconfig = "/home/vagrant/.gitconfig"

    concat { $gitconfig:
      owner => 'root',
      group => 'root',
      mode  => '0644'
    }

    concat::fragment{ 'base_gitconfig':
        target  => $gitconfig,
        source => "puppet:///modules/dotfiles/.gitconfig",
        order   => '01'
    }

    exec

    concat::fragment{ 'custom_gitconfig':
        target  => $gitconfig,
        source => "/vagrant/files/dotfiles/.gitconfig",
        order   => '02'
    }
}