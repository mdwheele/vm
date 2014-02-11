class epel (
    $enabled = 1,
    $debuginfo = 0,
    $source = 0
) {
    yumrepo { "epel":
        descr    => "Extra Packages for Enterprise Linux $operatingsystemmajrelease - \$basearch",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/$operatingsystemmajrelease/\$basearch",
        enabled  => $enabled
    }

    yumrepo { "epel-debuginfo":
        descr    => "Extra Packages for Enterprise Linux $operatingsystemmajrelease - \$basearch - Debug",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/$operatingsystemmajrelease/\$basearch/debug",
        enabled  => $debuginfo
    }

    yumrepo { "epel-source":
        descr    => "Extra Packages for Enterprise Linux $operatingsystemmajrelease - \$basearch - Source",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/$operatingsystemmajrelease/SRPMS",
        enabled  => $source
    }
}