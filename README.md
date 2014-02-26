"VM", a local development environment.
===

## Features

### Installed Packages

* PHP 5.3.3
* MySQL 5.1
* Apache 2.2
* HHVM (Used for running Composer)
* Git 1.7
* phpMyAdmin (latest)
* Composer (latest)
* PHPUnit (latest)
* WP-CLI


## Running the Environment

This is a [Vagrant](http://www.vagrantup.com/) development environment.  Vagrant is a command-line wrapper around [VirtualBox](https://www.virtualbox.org) and must be installed to use the environment.  Installation instructions for Vagrant & VirtualBox can be found below:

- [Installing VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Installing Vagrant](http://docs.vagrantup.com/v2/installation/index.html)

### Cloning the Repository

After installing Vagrant, you can clone this repository anywhere you choose.  The Vagrant configuration mounts a directory on the host system into the virtualized environment for Apache to serve so you will not be doing development inside this repo.  It can go anywhere!

**Clone this repository somewhere nice and fluffy!**

The following command will clone the repository to your current working directory:

```> git clone --recursive git@github.com:mdwheele/vm.git```

**Change directories into the cloned repository.**

In order to start any vagrant environment, you must be inside the directory where a `Vagrantfile` is specified.

**Start the environment.**

This step will take a significant amount of time to execute the first time you run it.  During a first start of this environment, the following operations will happen:

1. A [CentOS 6.5 Virtual Machine](http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box) will be downloaded, imported, configured, and booted into VirtualBox.
2. Core utilities will be provisioned.  This includes things like Yum repositories, `gcc`, `vim`, `git`, etc.
3. A LAMP Stack is provisioned.
4. Developer utilities are installed.  This includes things like phpMyAdmin, PHPUnit, Guard, Grunt, a SASS compiler, etc.

So, all that said, it takes about 8-10 minutes to provision on a circa 2010 Macbook Pro.  Just let it do its thang' and **do not stop it whatever you do**!

*Starting the environment*

	> vagrant up
	
*Logging into the VM*

	> vagrant ssh
	
*Stopping the environment*

	> vagrant halt
	
*Destroying the environment*

	> vagrant destroy
	
## Usage

### Common Tasks

This are things you might do regularly in the environment.  If there's no documentation for how to do something you want, please suggest additions!

#### Where's phpMyAdmin?!

The environment comes installed with phpMyAdmin.  The actual source of the tool is outside the webroot and an alias is added to allow Apache to serve the tool.  You can access phpMyAdmin at:

	http://localhost:8080/phpmyadmin
	
The tool automatically authenticates to the MySQL database running in the environment, so be careful.

#### Wahhhh, I hate phpMyAdmin!

Okay. For those of us that hate phpMyAdmin, here's instructions for using a hosted GUI client to establish a tunneled SSH session.  Below are a set of GUI clients that are fairly popular:

* [Sequel Pro](http://www.sequelpro.com/) (OS X)
* [HeidiSQL](http://www.heidisql.com/) (Windows)
* [MySQL Workbench](http://dev.mysql.com/downloads/tools/workbench/) (cross-platform)

When creating a new database connection in your tool of choice, choose "SSH Tunnel", "SSH", etc. and use the following connection details to set things up:

- MySQL Host: `127.0.0.1`
- Username: `root` (no password)
- Port: `3306`
- SSH Host: `localhost`
- SSH User: `vagrant`
- SSH Password: `vagrant`
- SSH Port: `2222`

If you have any problems, please [create an issue](https://github.com/mdwheele/vm/issues/new) and be sure to include as much information as possible and I will help where I can.

#### Working with GitHub inside the virtual machine.

This environment has SSH Agent Forwarding enabled.  This would allow you use the SSH key you've created for authenticating to GitHub inside the virtual environment.  However, there is one configuration step required before the virtual environment can use this key.

You'll need to make sure that the SSH key is added to the default SSH agent for your system.  This snippet can be added to your `bash_profile` or equivalent.

	key_file=~/.ssh/id_rsa

	# Add if not already added
	[[ -z $(ssh-add -L | grep $key_file) ]] && ssh-add $key_file
	
Once you do this, you should be able to log into the virtual environment and run the following command to verify everything is working as it should:

	> ssh -T git@github.com
	Hi _______! You've successfully authenticated, but GitHub does not provide shell access.
	
From here on, as long as your host machine adds your GitHub RSA key to the default SSH agent, it will be available for use inside the environment.

#### Running commands with `root` permissions.

You shouldn't need to do this often, but if you ever want to test-drive a package that isn't installed, it may be necessary.  In the case that you do find that something is not installed in the environment by default, please create an issue so that it may be considered.  

The `vagrant` user is, by default, added to `/etc/sudoers`.  To execute a command with `root` permissions, do as follows:

	> sudo vi /etc/hosts  

This would open `/etc/hosts` using the `vi` text editor with `root` permissions.

### "Oh no!" Moments

#### You accidentally blew something up and the environment doesn't work anymore.

First, please open an issue here with as much information as possible about what you were trying to do.  I'll help where I can to get you back on the right track.  However, sometimes your copy of the environment might deviate far away from the standard, Puppet blows chunks or whatever.

To attempt a reprovision of the environment, run the following command while inside the repository folder:

	> vagrant provision
	
If after reprovisioning the virtual environment things aren't working, there is always the option of destroying the environment and re-creating it from scratch.  Please note that this will **NOT** harm any code you were working on.  However, this **WILL** destroy any databases you had.  

To destroy the environment and recreate it, run the following command sequence:

	> vagrant destroy
	> vagrant up

## Development

### Contributing

Contributions are **welcome** and will be fully **credited**.  Contributions via Pull Requests are accepted on [Github](https://github/mdwheele/vm).  

#### Pull Requests

- **Document any change in behaviour** - Make sure the README and any other relevant documentation are kept up-to-date.

- **Create topic branches** - Don't ask us to pull from your master branch.

- **One pull request per feature** - If you want to do more than one thing, send multiple pull requests.

- **Send coherent history** - Make sure each individual commit in your pull request is meaningful. If you had to make multiple intermediate commits while developing, please squash them before submitting.
