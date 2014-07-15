class wp-cli {

    exec { "install-wp-cli" :
        command => "curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar > /usr/local/bin/wp-cli",
        creates => "/usr/local/bin/wp-cli",
        require => Class["php"]
    }

    file { "/usr/local/bin/wp-cli" :
        mode    => "a+x",
        require => Exec["install-wp-cli"]
    }

    file { "/usr/bin/wp" :
        ensure  => link,
        target  => "/usr/local/bin/wp-cli",
        require => Exec["install-wp-cli"]
    }

    file { "/home/vagrant/.wp-cli":
        ensure => directory
    }

    file { "/home/vagrant/.wp-cli/commands":
        ensure => directory
    }

    exec { "download-wp-cli-test":
        command => "/usr/local/bin/git clone https://github.com/pixline/wp-cli-theme-test-command.git /home/vagrant/.wp-cli/commands/theme-test",
        creates => "/home/vagrant/.wp-cli/commands/theme-test",
        require => Package["git"]
    }

    file { "/home/vagrant/.wp-cli/config.yml":
        ensure  => present,
        source => "puppet:///modules/wp-cli/config.yml",
    }

}