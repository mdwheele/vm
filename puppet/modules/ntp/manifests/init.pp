
class ntp {

    package {'ntp':
        ensure     => present,
    }

    service { 'ntpd':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
    }

    file { '/etc/ntp.conf':
        ensure     => file,
        source     => "puppet:///modules/ntp/ntp.conf",
        owner      => root,
        group      => root,
        mode       => 0644,
        notify     => Service['ntpd'],
    }

    file { '/var/lib/ntp':
        ensure     => directory,
        owner      => ntp,
        group      => ntp,
        mode       => 755,
        notify     => Service['ntpd'],
    }

}

