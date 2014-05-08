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

}