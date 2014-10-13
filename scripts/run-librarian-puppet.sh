#!/usr/bin/env bash

if [ "$(/usr/bin/gem search -i librarian-puppet)" = "false" ]; then
  echo "[Puppet Librarian] Installing modules..."
  cd /vagrant && librarian-puppet install --path puppet/modules-contrib
else
  echo "[Puppet Librarian] Updating modules..."
  cd /vagrant && librarian-puppet update
fi