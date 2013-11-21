class common {
    host { $fqdn:
        ensure => 'present'
    }
}