# Begin Puppet Manifest.  This file contains safety checks and sanity
# defaults.  To add nodes or additional specification create files in
# manifests/ which will be included.

Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
}

File {
  owner => 'vagrant',
  group => 'vagrant',
  mode  => '0777',
}

stage { "repos" :
    before  => Stage["main"]
}

node default {

    # Yum Repos
    $repos = [
        yum::repo::epel,
        yum::repo::rpmforge,
        yum::repo::remi,
        yum::repo::local
    ]

    class { $repos :
        stage   => repos
    }

    # OS Packages
    include selinux::disable, devtools

    # Application Stack
    include php, httpd, mysql::server, phpmyadmin

    # Development Tools
    include hhvm, phpunit, composer, wp-cli

    # Jenkins Hack Setup
    class { 'jenkins':
        config_hash => {
            'JENKINS_PORT' => { 'value' => '8080' },
            'JENKINS_ARGS' => { 'value' => '--prefix=/jenkins --httpListenAddress=127.0.0.1' }
        },
        plugin_hash => {
            'git' => {},
            'promoted-builds' => {},
            'credentials' => {},
            'parameterized-trigger' => {},
            'ssh-credentials' => {},
            'git-client' => {},
            'scm-api' => {},
            'token-macro' => {},
            'multiple-scms' => {}
        }
    }

    # User Environment Configuration
    include dotfiles

}