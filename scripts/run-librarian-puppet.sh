#!/usr/bin/env bash

if [ "$(/usr/bin/gem search -i librarian-puppet)" = "false" ]; then
  cd /vagrant && librarian-puppet install --path puppet/modules-contrib
else
  cd /vagrant && librarian-puppet update --path puppet/modules-contrib
fi