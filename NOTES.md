We'll need something for showing how to set up NFS vs. normal shared folders. I'm copying part of my config that I've
been flipping back and forth.

``` yaml

folders:
    - map: ~/Sites/
      to: /var/www/html/
      with: nfs
      options: ['nolock,vers=3,udp,noatime,actimeo=2']

#      with: ~
#      options: ['dmode=777,fmode=777']
```

## Puppet Gem Version conflicts with Vagrant-latest

Just need to revert the gem version to something previous. I think 3.7.5 or 3.8.1.

## SSH Agent Forwarding

- If you choose to enable agent forwarding, then the agent is forwarded and the VM provisioners will
  do **NO** work in adding identities to that agent for you. It's on the host machine's configuration to
  make sure that's all good.
- If there is no running agent, one is started upon SSH'ing to the VM as `vagrant` (`vagrant ssh`) and
  all keys previously provisioned to `/home/vagrant/.ssh` are added to the agent as identities.