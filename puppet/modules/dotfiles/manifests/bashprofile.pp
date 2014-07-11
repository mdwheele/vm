class dotfiles::bashprofile {
    $bashprofile = "/home/vagrant/.bash_profile"

    concat { $bashprofile:
        owner => 'root',
        group => 'root',
        mode  => '0644'
    }

    concat::fragment{ 'base_bashprofile':
        target  => $bashprofile,
        source => "puppet:///modules/dotfiles/.bash_profile",
        order   => '01'
    }

    concat::fragment{ 'custom_bashprofile':
        target  => $bashprofile,
        source => "/vagrant/files/dotfiles/.bash_profile",
        order   => '02'
    }
}