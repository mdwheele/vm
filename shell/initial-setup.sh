#!/bin/bash

VAGRANT_CORE_FOLDER=$(echo "$1")

if [[ ! -d /.vm-stuff ]]; then
    mkdir /.vm-stuff
    echo "${VAGRANT_CORE_FOLDER}" > "/.vm-stuff/vagrant-core-folder.txt"
    echo "Created directory /.vm-stuff"
fi

if [[ ! -f /.vm-stuff/initial-setup-repo-update ]]; then

    echo "Updating to Git 1.9.0"
    yum remove git -y >/dev/null
    yum install git -y >/dev/null
    echo "Finished updating to Git 1.9.0"

    echo "Running 'yum update' for the first time"
    yum update -y >/dev/null
    echo "Finished updating yum packages"

    #touch /.puphpet-stuff/initial-setup-repo-update

fi