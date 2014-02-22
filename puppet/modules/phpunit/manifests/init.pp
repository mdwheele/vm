class phpunit {

    exec { "install-phpunit" :
        command   => "/usr/bin/wget -q https://phar.phpunit.de/phpunit.phar -O /usr/local/bin/phpunit",
        creates   => "/usr/local/bin/phpunit",
        require   => Class["php"]
    }

    file { "/usr/local/bin/phpunit" :
        mode    => "a+x",
        require => Exec["install-phpunit"]
    }

    file { "/usr/bin/phpunit" :
        ensure  => link,
        target  => "/usr/local/bin/phpunit",
        require => Exec["install-phpunit"]
    }

}