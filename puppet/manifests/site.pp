# Begin Puppet Manifest.  This file contains safety checks and sanity
# defaults.  To add nodes or additional specification create files in
# manifests/ which will be included.

notify {"This is Puppet environment $environment.": }

# Default exec parameters

Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
}

# Default Package parameters

Package {
    ensure => installed,
}

# Packages

node default {

    include selinux::disable, epel, devtools, rpmforge

    # LAMP Stack. Wrap this. Durty durty.
    class { "php" :
        error_verbosity => true,
        display_errors => true,
    }

    include httpd, mysql

}