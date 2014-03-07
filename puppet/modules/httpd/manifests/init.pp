class httpd (

) {

    $packages = [ "httpd" ]

    package { $packages:
        ensure  => present,
    }

    file { "/etc/httpd/conf/httpd.conf":
        ensure  => present,
        content => template("httpd/httpd.conf.erb"),
        owner   => root,
        group   => root,
        mode    => 644,
        notify  => Service["httpd"],
    }

    file { "/etc/httpd/conf.d/default.conf":
        ensure  => present,
        source => "puppet:///modules/httpd/default.conf",
        owner   => root,
        group   => root,
        mode    => 644,
        notify  => Service["httpd"],
    }

    file { "/etc/httpd/conf.d/jenkins-proxy.conf":
        ensure  => present,
        source => "puppet:///modules/httpd/jenkins-proxy.conf",
        owner   => root,
        group   => root,
        mode    => 644,
        notify  => Service["httpd"],
    }

    file { "/etc/mime.types":
        ensure  => present,
        source  => "puppet:///modules/httpd/mime.types",
        owner   => root,
        group   => root,
        mode    => 644,
        notify  => Service["httpd"],
    }

    service { "httpd":
        ensure	=> running,
        enable	=> true,
        hasstatus => true,
        hasrestart => true,
    }

}
