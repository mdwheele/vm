class devtools::vm {

    file { '/usr/bin/vm':
       ensure => 'link',
       target => '/vagrant/scripts/vm',
    }

}