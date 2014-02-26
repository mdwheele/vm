class devtools::vm {

    file { '/usr/bin/failboat':
       ensure => 'link',
       target => '/vagrant/puppet/scripts/failboat',
    }

}