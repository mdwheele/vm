# Begin Puppet Manifest.  This file contains safety checks and sanity
# defaults.  To add nodes or additional specification create files in
# manifests/ which will be included.

Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
}

node default {

    # OS Packages
    include selinux::disable, epel, devtools, rpmforge

    # Application Stack
    include php, httpd, mysql::server, phpmyadmin

    # Development Tools
    include hhvm, phpunit, composer, wp-cli

    # User Environment Configuration
    include dotfiles

}