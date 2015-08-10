class yum::repo::eosphp54 {

    yumrepo { "eos-php54" :
        ensure => present,
        baseurl => "http://install.linux.ncsu.edu/pub/yum/itecs/servers/php54",
        descr => "EOS testing repository",
        enabled => 1,
        gpgcheck => 0,
        failovermethod => "priority"
    }

}