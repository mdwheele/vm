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