class dotfiles {

    file { "/home/vagrant/.bash_profile":
        mode => 644,
        source => "puppet:///modules/dotfiles/.bash_profile",
    }

}