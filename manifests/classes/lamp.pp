class lamp {
    package { php:
        ensure => 'latest',
    }

    class { 'apache':
        default_vhost => true,
        mpm_module => 'prefork',
    }

    class { 'apache::mod::php':
        require => Package["php"]
    }

    firewall { '100 allow http, ssl, and mysql access':
        port   => [80, 443, 3306],
        proto  => tcp,
        action => accept,
    }

}