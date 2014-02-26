class epel (

    $enabled = 1,
    $debuginfo = 0,
    $source = 0

) {

    yumrepo { "epel":
        descr    => "Extra Packages for Enterprise Linux ${operatingsystemmajrelease} - \$basearch",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/${operatingsystemmajrelease}/\$basearch",
        enabled  => $enabled,
        priority => 10,
    }

    yumrepo { "epel-debuginfo":
        descr    => "Extra Packages for Enterprise Linux ${operatingsystemmajrelease} - \$basearch - Debug",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/${operatingsystemmajrelease}/\$basearch/debug",
        enabled  => $debuginfo,
        priority => 10,
    }

    yumrepo { "epel-source":
        descr    => "Extra Packages for Enterprise Linux ${operatingsystemmajrelease} - \$basearch - Source",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/${operatingsystemmajrelease}/SRPMS",
        enabled  => $source,
        priority => 10,
    }

    file { "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${$operatingsystemmajrelease}":
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => "puppet:///modules/epel/RPM-GPG-KEY-EPEL-${$operatingsystemmajrelease}",
    }

    epel::rpm_gpg_key{ "EPEL-${operatingsystemmajrelease}":
        path    => "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-${operatingsystemmajrelease}",
        before  => Yumrepo['epel','epel-source','epel-debuginfo'],
    }

}