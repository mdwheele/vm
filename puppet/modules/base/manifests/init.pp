class base {
    yumrepo { "epel":
        descr    => "Extra Packages for Enterprise Linux $operatingsystemmajrelease - \$basearch",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/$operatingsystemmajrelease/\$basearch",
        enabled  => 1
    }

    yumrepo { "epel-debuginfo":
        descr    => "Extra Packages for Enterprise Linux $lsbmajdistrelease - \$basearch - Debug",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/$lsbmajdistrelease/\$basearch/debug",
        enabled  => 0
    }

    yumrepo { "epel-source":
        descr    => "Extra Packages for Enterprise Linux $lsbmajdistrelease - \$basearch - Source",
        baseurl  => "ftp://ftp.linux.ncsu.edu/pub/epel/$lsbmajdistrelease/SRPMS",
        enabled  => 0
    }
}