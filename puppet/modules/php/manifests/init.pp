class php (

    $error_verbosity = true,
    $display_errors = true

) {

    $packages = [
        "php",
        "php-pdo",
        "php-gd",
        "php-xml",
        "php-odbc",
        "php-soap",
        "php-xmlrpc",
        "php-pear",
        "php-mysql",
        "php-ldap",
        "php-mbstring",
        "php-imap",
        "php-dba",
        "php-snmp",
        "php-bcmath",
        "php-mcrypt",
        "php-process"
    ]

    package { $packages:
        ensure  => latest
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
