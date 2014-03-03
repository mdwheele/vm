class yum::repo::remi {

    yumrepo { "remi" :
        descr       => "Les RPM de remi pour Enterprise Linux 6 - \$basearch",
        mirrorlist  => "http://rpms.famillecollet.com/enterprise/6/remi/mirror",
        enabled     => 0
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-remi" :
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "puppet:///modules/yum/RPM-GPG-KEY-remi",
    }

    yum::rpm_gpg_key{ "RPM-GPG-KEY-remi" :
        path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-remi",
        before  => Yumrepo["remi"]
    }

}