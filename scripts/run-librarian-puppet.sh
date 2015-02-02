#!/usr/bin/env bash

echo "[Puppet Librarian] Installing and updating Puppet modules..."
cd /vagrant && librarian-puppet install --path puppet/modules-contrib