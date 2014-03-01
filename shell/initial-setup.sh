#!/bin/bash

VAGRANT_CORE_FOLDER=$(echo "$1")

if [[ ! -d /.vm-stuff ]]; then

    mkdir /.vm-stuff
    echo "${VAGRANT_CORE_FOLDER}" > "/.vm-stuff/vagrant-core-folder.txt"
    echo "Created directory /.vm-stuff"

fi

if [[ ! -f /.vm-stuff/initial-setup ]]; then

    echo "Removing installed version of Git"
    echo "  - Dependency issues with Git 1.7 from CentOS base"
    echo "  - Git 1.9.0 is installed by Puppet provisioner"
    yum remove git -y >/dev/null
    echo "Finished removing Git"

    echo "Running 'yum update' for the first time"
    yum update -y >/dev/null
    echo "Finished updating yum packages"

    touch /.vm-stuff/initial-setup

fi