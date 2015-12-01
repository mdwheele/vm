class devtools {

    exec { "groupinstall_development_tools" :
        command => "yum -y groupinstall 'Development Tools'",
        unless  => "yum list installed | grep rpm-build",
        require => Yumrepo["epel", "rpmforge", "local"]
    }

    $packages = [
        # RPM Building...
        "zlib-devel",
        "perl-ExtUtils-MakeMaker",
        "asciidoc",
        "xmlto",
        "openssl-devel",
        "rpmdevtools",
        "mock",

        # General,
        "git",
        "htop",
        "atop",
        "apachetop",
        "iotop",

        # PHP...
        "vim-X11",
        "vim-common",
        "vim-enhanced",
        "vim-minimal",
        "libxml2-devel",
        "httpd-devel",
        "libXpm-devel",
        "gmp-devel",
        "libicu-devel",
        "t1lib-devel",
        "aspell-devel",
        "bzip2-devel",
        "libcurl-devel",
        "libjpeg-turbo-devel",
        "libvpx-devel",
        "libpng-devel",
        "freetype-devel",
        "readline-devel",
        "libtidy-devel",
        "libxslt-devel",
        "libmcrypt-devel"
    ]

    package { $packages :
        ensure  => latest,
        require => Yumrepo["epel", "rpmforge", "local"]
    }

    if ! defined(Package["curl"]) {
        package { "curl" :
            ensure => latest,
            require => Yumrepo["epel", "rpmforge", "local"]
        }
    }

}
