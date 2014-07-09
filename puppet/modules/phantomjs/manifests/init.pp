class phantomjs {

    $dependencies = [
        'fontconfig',
        'freetype'
    ]

    package { $dependencies :
        ensure => latest
    }

    exec {
        'wget-package':
            cwd       => '/tmp',
            command   => '/usr/bin/wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 --output-document=phantomjs-1.9.7-linux-x86_64.tar.bz2',
            logoutput => on_failure,
            creates   => '/tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2',
            require   => Package['wget'];

        'install-phantomjs':
            cwd       => '/opt',
            command   => '/bin/tar -xjf /tmp/phantomjs-1.9.7-linux-x86_64.tar.bz2',
            logoutput => on_failure,
            creates   => '/opt/phantomjs-1.9.7-linux-x86_64',
            require   => Exec['wget-package'];
    }

    file {
        '/usr/local/bin/phantomjs':
            ensure  => 'link',
            target  => '/opt/phantomjs-1.9.7-linux-x86_64/bin/phantomjs',
            require => Exec['install-phantomjs'];
    }

}