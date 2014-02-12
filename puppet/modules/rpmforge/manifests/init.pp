class rpmforge (

    $enabled = 1,
    $extras = 0,
    $testing = 0

) {

    yumrepo { 'rpmforge':
        descr       => "Rpmforge",
        baseurl     => "http://apt.sw.be/redhat/el${operatingsystemmajrelease}/en/${architecture}/rpmforge/",
        enabled     => $enabled,
    }

    yumrepo { 'rpmforge-extras':
        descr       => "Rpmforge extras",
        baseurl     => "http://apt.sw.be/redhat/el${operatingsystemmajrelease}/en/${architecture}/extras/",
        enabled     => $extras,
    }

    yumrepo { 'rpmforge-testing':
        descr       => "Rpmforge testing",
        baseurl     => "http://apt.sw.be/redhat/el${operatingsystemmajrelease}/en/${architecture}/testing",
        enabled     => $testing,
    }

}