class httpd (

) {

    $packages = [ "httpd" ]

    package { $packages:
        ensure  => present,
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
