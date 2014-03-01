class devtools::php {

    $packages = [
        "vim-X11",
        "vim-common",
        "vim-enhanced",
        "vim-minimal",
        "curl",
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
        ensure => latest,
        require => Class["devtools::rpmbuild"]
    }

}