class devtools::php {

    $packages = [
        "gcc",
        "gcc-c++",
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
        "openssl-devel",
        "bzip2-devel",
        "libcurl-devel",
        "libjpeg-turbo-devel",
        "libvpx-devel",
        "libpng-devel",
        "freetype-devel",
        "readline-devel",
        "libtidy-devel",
        "libxslt-devel",
        "libmcrypt-devel",
        "make"
    ]

    package { $packages :
        ensure => installed,
    }

}