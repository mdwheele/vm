# Begin Puppet Manifest.  This file contains safety checks and sanity
# defaults.  To add nodes or additional specification create files in
# manifests/ which will be included.

Exec {
    path => ["/bin", "/sbin", "/usr/bin", "/usr/sbin"],
}

node default {

    include selinux::disable, epel, devtools, rpmforge
    include php, httpd, mysql, phpmyadmin
    include phpunit, composer, wp-cli
    include dotfiles

}