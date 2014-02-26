class composer {

    exec { "install-composer" :
        command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer",
        creates => "/usr/local/bin/composer",
        require => Class["php"]
    }

    file { "/usr/local/bin/composer" :
        mode    => "a+x",
        require => Exec["install-composer"]
    }

    file { "/usr/bin/composer" :
        ensure  => link,
        target  => "/usr/local/bin/composer",
        require => Exec["install-composer"]
    }

}