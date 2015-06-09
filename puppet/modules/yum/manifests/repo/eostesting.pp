class yum::repo::eostesting {

    yumrepo { "eos-testing" :
        ensure => present,
        baseurl => "http://install.linux.ncsu.edu/pub/yum/itecs/servers/eos-RHEL6-testing",
        descr => "EOS testing repository",
        enabled => 1,
        gpgcheck => 0,
        failovermethod => "priority"
    }

}