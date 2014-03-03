class yum::repo::rpmforge {

    yumrepo { "rpmforge" :
        descr   => "Rpmforge",
        baseurl => "http://apt.sw.be/redhat/el${operatingsystemmajrelease}/en/${architecture}/rpmforge/",
        enabled => 1,
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag" :
        ensure => present,
        owner  => "root",
        group  => "root",
        mode   => "0644",
        source => "puppet:///modules/yum/RPM-GPG-KEY-rpmforge-dag",
    }

    yum::rpm_gpg_key{ "rpmforge" :
        path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
        before  => Yumrepo["rpmforge"],
    }

}