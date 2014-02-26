class phpmyadmin::download {

    file { "/usr/share/phpmyadmin":
        ensure  => "directory",
        owner   => "vagrant",
        group   => "vagrant",
        mode    => 775
    }

    exec { "phpmyadmin_wget":
        command   => "/usr/bin/wget https://github.com/phpmyadmin/phpmyadmin/archive/STABLE.tar.gz -O /tmp/phpmyadmin-stable.tar.gz",
        logoutput => on_failure,
        creates   => "/tmp/phpmyadmin-stable.tar.gz",
        require   => File["/usr/share/phpmyadmin"]
    }

    exec { "phpmyadmin_unzip":
        cwd     => "/usr/share/phpmyadmin",
        command => "/bin/tar xvf /tmp/phpmyadmin-stable.tar.gz --strip-components=1 && chown -R vagrant:vagrant .",
        require => Exec["phpmyadmin_wget"]
    }

}