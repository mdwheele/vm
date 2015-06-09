VM
===

** This README.md is somewhat out of date, however, it is retained for reference until it can be updated; the upstream repository deleted the entire contents of the file. **

## Features

### Installed Packages

* PHP 5.4.x
* MySQL 5.1.x
* Apache 2.2
* HHVM (Used for running Composer)
* Git 1.9.x
* Composer (latest)
* PHPUnit (latest)
* WP-CLI
* PhantomJS 1.9.x

## Running the Environment

This is a [Vagrant](http://www.vagrantup.com/) development environment.  Vagrant is a command-line wrapper around [VirtualBox](https://www.virtualbox.org) and must be installed to use the environment.  Installation instructions for Vagrant & VirtualBox can be found below:

- [Installing VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Installing Vagrant](http://docs.vagrantup.com/v2/installation/index.html)
- [Installing Vagrant VBGuest](https://github.com/dotless-de/vagrant-vbguest) (required plugin for sanity)

### Cloning the Repository

After installing Vagrant, you can clone this repository anywhere you choose.  The Vagrant configuration mounts a directory on the host system into the virtualized environment for Apache to serve so you will not be doing development inside this repo.  It can go anywhere!

**Clone this repository somewhere nice and fluffy!**

The following command will clone the repository to your current working directory:

	git clone --recursive git@github.com:mdwheele/vm.git

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

	vagrant up

*Provision the VM*

The first time you run `vagrant up`, it will run the `provision` command for you as well, one time only:

	vagrant provision

The provision command performs the initial setup of the vm and updates the yum packages.  

You should re-run this whenever you install a new package: unpack its rpm into the `/files/rpm` directory first.
	
*Logging into the VM*

	vagrant ssh
	
*Stopping the environment*

	vagrant halt
	
*Destroying the environment*

	vagrant destroy

## Upgrading the repository and your virtual machine

Either repeat the install steps from *Cloning the Repository* on, or 

**At the root of the cloned repository:**

```bash
vagrant halt
git pull origin master
git submodule init
git submodule update
vagrant up
vagrant provision
```

When you run `vagrant up`, [Vagrant VBGuest](https://github.com/dotless-de/vagrant-vbguest) will make sure that the VirtualBox guest additions are synchronized between your host machine and the virtual machine.  Make sure this vagrant plugin is installed via the [instructions](https://github.com/dotless-de/vagrant-vbguest).

## Usage

### Common Tasks

This are things you might do regularly in the environment.  If there's no documentation for how to do something you want, please suggest additions!

#### Sharing folders

Do not use VirtualBox's shared folder settings. The settings are managed by Vagrant, and any changes made in the VirtualBox Shared Folder dialog will be lost.

To share a new folder, edit `config.yaml` and add a "synced_folder" entry, for example:
```
    synced_folder:
        enabled: true
        host_path: '~/workspace'
        guest_path: '/var/www/html'
```

It is recommended that after mounting a folder in which you have a git repo, you run 
```
git status
```

Verify that the working directory appears clean from inside the VM.  GIT may assume that restrictions on file modes through shared folders are explicit changes, 
and show all files as modified. You can edit `.git/config` and change the `core.filemode` property to `false` to suppress this behavior inside the VM. 
The filemode setting will make any file mode changes invisible to GIT; you can change it back to check in actual file mode changes (but this will probably only be sensible to do outside of the VM). 

#### Modifying VM Resources and Configuration

You can modify a few configuration settings on the VM to personalize it to your specific needs. While there are not currently too many options available, I hope to expose more at a later time.

The first time you provision the repository, a distributable configuration schema is copied to the final path `config.yaml`, which is ignored from source control.

This file looks like the following and is pretty self explanatory.

```yaml
---
vm-config:
    memory: 2048
    host:
        http_port: 8080
        https_port: 8443
    synced_folder:
        enabled: false
        host_path: '~/Sites'
        guest_path: '/var/www/html'
```

##### _Note_

It is fairly common to have a conflict if another server on localhost has already allocated ports 80 and 443 - the ports for the HTTP and HTTPS services respectively.

So the default configuration remaps these ports on the VM to alternatives. You'll need to accomodate the alternate ports when accessing your Web application through a browser, for instance:

```
https://localhost:8443/my/web/app/path
```

#### Installing other RPMs

You can download RPMs to add to the vm and then copy them to your `<path to vm repo>/files/rpm` directory.

#### Adding custom dotfiles

If you want to add any custom dotfiles, you can put them in the `<path to vm repo>/files/dotfiles` directory.

The provisioning process will copy some useful "base" dotfiles that are part of the common virtual environment.  In addition to this, developers may place custom dotfiles in the above path that will be appended to the end of the base dotfiles.

The base dotfiles are located here:

* [.gitconfig](puppet/modules/dotfiles/files/.gitconfig)
* [.bash_profile](puppet/modules/dotfiles/files/.bash_profile)

Please feel free to contribute to these [base configurations](puppet/modules/dotfiles/files). If you do, be sure to leave comments above the configuration to describe what it does if it's not obvious (assume limited shell / bash scripting experience; this is not only for experienced developers, but also for folks trying to learn!)

#### Checking mail sent by PHP

If your application uses sendmail to send email, that path has been modified to instead, `tee` to a log file in `/tmp/php-mail`.

The easiest way to monitor that file is to run: `tail -f /tmp/php-mail`.

#### Database access from host machine

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

	sudo vi /etc/hosts  

This would open `/etc/hosts` using the `vi` text editor with `root` permissions.

#### Running PhantomJS

This is bad documentation, but for the purposes of running acceptance tests using a tool like Codeception or Behat, PhantomJS is installed on the virtual machine.

I usually run PhantomJS in it's own "tab" (open another ssh session).  I do this because PhantomJS sends output to the terminal that makes reading acceptance tests hard (in the case I run PhantomJS as a background process).

**To run PhantomJS:** `phantomjs --webdriver 4444` or as a background-process `phantomjs --webdriver 4444 &`.

### "Oh no!" Moments

#### You accidentally blew something up and the environment doesn't work anymore.

First, please open an issue here with as much information as possible about what you were trying to do.  I'll help where I can to get you back on the right track.  However, sometimes your copy of the environment might deviate far away from the standard, Puppet blows chunks or whatever.

To attempt a reprovision of the environment, run the following command while inside the repository folder:

	vagrant provision
	
If after reprovisioning the virtual environment things aren't working, there is always the option of destroying the environment and re-creating it from scratch.  Please note that this will **NOT** harm any code you were working on.  However, this **WILL** destroy any databases you had.  

To destroy the environment and recreate it, run the following command sequence:

	vagrant destroy
	vagrant up

## Development

### Contributing

Contributions are **welcome** and will be fully **credited**.  Contributions via Pull Requests are accepted on [Github](https://github/mdwheele/vm).  

#### Pull Requests

- **Document any change in behaviour** - Make sure the README and any other relevant documentation are kept up-to-date.

- **Create topic branches** - Don't ask us to pull from your master branch.

- **One pull request per feature** - If you want to do more than one thing, send multiple pull requests.

- **Send coherent history** - Make sure each individual commit in your pull request is meaningful. If you had to make multiple intermediate commits while developing, please squash them before submitting.
