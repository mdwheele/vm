#!/usr/bin/env bash

if [ "$(gem search -i librarian-puppet)" = "false" ]; then
  gem install librarian-puppet
  cd /vagrant && librarian-puppet install --path puppet/modules-contrib
else
  cd /vagrant && librarian-puppet update
fi