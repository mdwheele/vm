class phpmyadmin {

    include phpmyadmin::download

    file { "/usr/share/phpmyadmin/config.inc.php" :
        ensure  => present,
        content => template("phpmyadmin/config.inc.php.erb"),
        owner   => vagrant,
        group   => vagrant,
        mode    => 644,
        notify  => Service["httpd"],
        require => Class["phpmyadmin::download"]
    }

    file { "/etc/httpd/conf.d/phpmyadmin.conf" :
        ensure  => present,
        content => template("phpmyadmin/phpmyadmin.conf.erb"),
        owner   => vagrant,
        group   => vagrant,
        mode    => 644,
        notify  => Service["httpd"],
        require => Class["phpmyadmin::download"]
    }

}
