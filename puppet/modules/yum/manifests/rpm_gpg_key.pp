define yum::rpm_gpg_key($path) {

    exec {  "import-${name}":
        path      => '/bin:/usr/bin:/sbin:/usr/sbin',
        command   => "rpm --import ${path}",
        unless    => "rpm -q gpg-pubkey-$(echo $(gpg --throw-keyids < ${path}) | cut --characters=11-18 | tr '[A-Z]' '[a-z]')",
        require   => File[$path],
        logoutput => 'on_failure',
    }

}