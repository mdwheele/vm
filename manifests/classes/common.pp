class common {
    host { $fqdn:
        ensure => 'present',
        ip => '127.0.0.1'
    }

    File {
      owner => 'root',
      group => 'root',
      mode  => '0644',
    }
}