class hhvm  {

    yumrepo { "hop5" :
        descr    => "www.hop5.in Centos Repository",
        baseurl  => "http://www.hop5.in/yum/el6",
        enabled  => 1,
        gpgcheck => 0
    }

    package { "hhvm" :
        ensure  => latest,
        require => Yumrepo["hop5"]
    }

}