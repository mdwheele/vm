#!/bin/bash

echo "Checking for updates..."
number=$(yum check-update | egrep '(.i386|.x86_64|.noarch|.src)' | wc -l)

if [[ number -gt 0 ]]; then

    echo "Found $number updates. Installing..."
    yum update -y >/dev/null
    echo "Updates completed."

else
    echo "There were no updates! Huzzah."
fi

echo "Gone!"