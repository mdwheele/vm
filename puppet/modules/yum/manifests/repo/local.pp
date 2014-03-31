class yum::repo::local {

    package { "createrepo" :
        ensure => present,
    }

    exec { "build_local_repository" :
        command => "sudo rm -rf /repository && sudo mkdir -p /repository && sudo cp -r /vagrant/files/rpm/*.rpm /repository/ && sudo createrepo /repository && sudo yum clean all",
        require => Package["createrepo"]
    }

    yumrepo { "local" :
        descr       => "Local Yum Repository for Manually Packaged RPM's.",
        baseurl     => "file:///repository/",
        enabled     => 1,
        gpgcheck    => 0,
        require => Exec["build_local_repository"]
    }

}