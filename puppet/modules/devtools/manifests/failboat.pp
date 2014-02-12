class devtools::failboat {

    file { '/usr/bin/failboat':
       ensure => 'link',
       target => '/vagrant/puppet/scripts/failboat',
    }

}