class php-cs-fixer {

    exec { "install-php-cs-fixer" :
        command => "sudo curl http://get.sensiolabs.org/php-cs-fixer.phar -o /usr/local/bin/php-cs-fixer",
        creates => "/usr/local/bin/php-cs-fixer",
        require => Class["php"]
    }

    file { "/usr/local/bin/php-cs-fixer" :
        mode    => "a+x",
        require => Exec["install-php-cs-fixer"]
    }

    file { "/usr/bin/php-cs-fixer" :
        ensure  => link,
        target  => "/usr/local/bin/php-cs-fixer",
        require => Exec["install-php-cs-fixer"]
    }

}