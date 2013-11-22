class lamp {
    package { php:
        ensure => 'latest',
    }

    package { php-mysql:
        ensure => latest,
        require => Package['php']
    }

    package { php-common:
        ensure => latest,
        require => Package['php']
    }

    package { php-mcrypt:
        ensure => latest,
        require => Package['php']
    }

    # Configure Apache
    class { 'apache':
        default_vhost => true,
        mpm_module => 'prefork',
    }
    ->
    exec { 'add phpmyadmin aliases':
        command => '/bin/echo "Alias /phpmyadmin /usr/share/phpMyAdmin" > /etc/httpd/conf.d/phpMyAdmin.conf',
        notify => Service['httpd']
    }

    exec { 'install phpmyadmin':
        command => '/usr/bin/yum install phpmyadmin -y'
    }

    # Add PHP Apache Module
    class { 'apache::mod::php':
        require => Package["php"]
    }

    # Configure MySQL
    class { '::mysql::server':
        root_password => 'root',
    }

}