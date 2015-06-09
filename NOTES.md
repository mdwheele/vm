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