![image](https://f.cloud.github.com/assets/2453394/2131655/75d3d610-92a3-11e3-977c-44a3cb6ec8c0.png)

This repository is for the S.S. Failboat, a local development environment maintained by Captain Horace, the Dragon Daddy (aka @mdwheele).

## Features

### Installed Packages

* PHP 5.3.3
* Apache
* Git 1.7

## Installation Instructions

Prerequisites:

Install these according to instructions on the vagrant website
- install vagrant [download here](http://www.vagrantup.com/downloads)
- install virtual box [download here](https://www.virtualbox.org/wiki/Downloads)

Build the failboat:

1. clone this repo
2. cd into it
3. run vagrant.  wait for provisioning to happen.  

  > vagrant up

4. preview your php info by creating index.php

  <?php phpinfo(); ?>
  
  Put this in your ~/Sites folder and go to http://localhost:8080/index.php
should have a phpinfo page with 5.3.3.

Stop the failboat:

  > vagrant halt

## Usage

TBD

## Development

### Contributing

Contributions are **welcome** and will be fully **credited**.  Contributions via Pull Requests are accepted on [Github](https://github/mdwheele/failboat).  

#### Pull Requests

- **Document any change in behaviour** - Make sure the README and any other relevant documentation are kept up-to-date.

- **Create topic branches** - Don't ask us to pull from your master branch.

- **One pull request per feature** - If you want to do more than one thing, send multiple pull requests.

- **Send coherent history** - Make sure each individual commit in your pull request is meaningful. If you had to make multiple intermediate commits while developing, please squash them before submitting.
