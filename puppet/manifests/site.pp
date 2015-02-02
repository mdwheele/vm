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

Package {
  allow_virtual => false
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
    yum::repo::eostesting,
    yum::repo::local
  ]

  class { $repos :
    stage   => repos
  }

  # Set timezone
  file { '/etc/localtime':
    ensure => link,
    target => "/usr/share/zoneinfo/America/New_York"
  }

  # OS Packages
  include selinux::disable, devtools, ntp

  # Application Stack
  include php, httpd, mysql::server

  # Development Tools
  include phpunit, wp-cli, phpcsfixer

  class { 'composer':
    auto_update => true
  }

  # Node Tools
  include nodejs, phantomjs

  package { 'gulp':
    ensure => present,
    provider => 'npm',
    require => Package['npm']
  }

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
      'multiple-scms' => {},
      'ssh-agent' => {},
      'email-ext' => {}
    }
  }

  user { ["vagrant", "jenkins"]:
    ensure => present,
    groups => ["vagrant", "mock"],
    require => [Package["jenkins"], Package["mock"]]
  }

  # User Environment Configuration
  include dotfiles

}