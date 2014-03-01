class devtools::rpmbuild {

    exec { "groupinstall_development_tools" :
        command => "yum -y groupinstall 'Development Tools'",
        unless  => "yum list installed | grep rpm-build"
    }

    $packages = [
        "zlib-devel",
        "perl-ExtUtils-MakeMaker",
        "asciidoc",
        "xmlto",
        "openssl-devel"
    ]

    package { $packages :
        ensure  => latest,
        require => Exec["groupinstall_development_tools"]
    }

}