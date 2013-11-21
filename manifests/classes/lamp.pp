class lamp {
    package { php5:
        ensure => latest,
    }

    package { php5-gd:
        ensure => latest,
        require => Package['php5']
    }

    package { php5-mysql:
        ensure => latest,
        require => Package['php5']
    }

    package { php5-curl:
        ensure => latest,
        require => Package['php5']
    }

    package { php5-common:
        ensure => latest,
        require => Package['php5']
    }

    package { php5-cli:
        ensure => latest,
        require => Package['php5']
    }

    package { php-apc:
        ensure => latest,
        require => Package['php5']
    }

    package { php-pear:
        ensure => latest,
        require => Package['php5']
    }

    package { php-console-table:
        ensure => latest,
        require => [Package['php5'], Package['php-pear']]
    }

    class { 'apache':
        default_vhost => false,
        mpm_module => 'prefork',
    }

    class { 'apache::mod::php':
        require => Package["php5"]
    }

    class { '::mysql::server':
        root_password => 'root',
    }
}