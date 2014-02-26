class yum::priorities {

    package { "yum-plugin-priorities":
        ensure => present
    }

}