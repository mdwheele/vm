class devtools::rpmbuild {

    exec { "groupinstall_development_tools" :
        command => "yum groupinstall 'Development Tools'",
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
        ensure  => installed,
        require => Exec["groupinstall_development_tools"]
    }

}