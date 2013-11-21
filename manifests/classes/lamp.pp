class lamp {
    package { php:
        ensure => 'latest',
    }

    package { php-gd:
        ensure => latest,
        require => Package['php']
    }

    package { php-mysql:
        ensure => latest,
        require => Package['php']
    }

    package { php-common:
        ensure => latest,
        require => Package['php']
    }

    package { php-cli:
        ensure => latest,
        require => Package['php']
    }

    package { php-pecl-apc:
        ensure => latest,
        require => Package['php']
    }

    package { php-pear:
        ensure => latest,
        require => Package['php']
    }

    class { 'apache':
        default_vhost => false,
        mpm_module => 'prefork',
    }

    apache::vhost { 'first.local.dev':
        port    => '80',
        docroot => '/var/www/first',
    }

    class { 'apache::mod::php':
        require => Package["php"]
    }

    class { '::mysql::server':
        root_password => 'root',
    }
}