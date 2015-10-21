class yum::repo::eosphp {

    yumrepo { "eos-php" :
        ensure => present,
        baseurl => "http://install.linux.ncsu.edu/pub/yum/itecs/servers/php56",
        descr => "EOS testing repository",
        enabled => 1,
        gpgcheck => 0,
        failovermethod => "priority"
    }

    # Temporary
    yumrepo { "eos-php54" :
        ensure => absent
    }

}