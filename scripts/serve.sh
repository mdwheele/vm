#!/usr/bin/env bash

if [[ $1 == "." ]]; then
    path=$(pwd)
elif [ -z $1 ]; then
    path=$(pwd)
elif [[ $1 == "reset" ]]; then
    path="/var/www/html"
else
    path=$(readlink -e $1)
fi

if [ ! -z $2 ]; then
    env=$2
else
    env="local"
fi

# If path is not a directory, bail.
if [ ! -d "$path" ] && [ ! -f "$path" ]; then
    echo "Error: $path is not a valid directory or file.\n\n"
fi

if [ -f "$path" ]; then
    block=$(cat $path)
else

block="<VirtualHost *:80>
    ServerName localhost
    DocumentRoot $path
    <Directory \"$path\">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
    SetEnv APP_ENV $env
</VirtualHost>
<VirtualHost *:443>
    ServerName localhost
    DocumentRoot $path
    SSLEngine on
    SSLCertificateFile /etc/httpd/ssl/ssl.crt
    SSLCertificateKeyFile /etc/httpd/ssl/ssl.key
    <Directory \"$path\">
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
    SetEnv APP_ENV $env
</VirtualHost>
"
fi

echo "Serving $path"
echo "$block" | sudo tee /etc/httpd/conf.d/default.conf >/dev/null

echo "Restarting the web server"
sudo /sbin/service httpd restart