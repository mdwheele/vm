class php (

    $error_verbosity = false,
    $display_errors = false,

) {

    $packages = [ "php", "php-pdo", "php-gd", "php-xml", "php-odbc", "php-soap", "php-xmlrpc", "php-pear", "php-mysql", "php-ldap", "php-mbstring", "php-imap", "php-dba", "php-snmp", "php-pecl-ncurses", "php-bcmath", "php-mcrypt" ]

    package { $packages:
        ensure  => present,
    }

    file { "/etc/php.ini":
        ensure  => present,
        content => template("php/php.ini.erb"),
        owner   => root,
        group   => root,
        mode    => 644,
        notify  => Service["httpd"],
    }

}
