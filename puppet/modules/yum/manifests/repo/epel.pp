class yum::repo::epel {

    yumrepo { "epel" :
        descr    => "Extra Packages for Enterprise Linux ${operatingsystemmajrelease} - \$basearch",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/${operatingsystemmajrelease}/\$basearch",
        enabled  => 1
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${$operatingsystemmajrelease}" :
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "puppet:///modules/yum/RPM-GPG-KEY-EPEL-${$operatingsystemmajrelease}",
    }

    yum::rpm_gpg_key{ "EPEL-${operatingsystemmajrelease}" :
        path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${operatingsystemmajrelease}",
        before  => Yumrepo["epel"]
    }

}