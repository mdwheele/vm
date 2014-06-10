VM
===

After you have pulled the VM project and you're ready to begin your work in the environment, there are a few changes/setup you will want to complete.  

1. SSH into the VM to get to your filespace
  

        > vagrant ssh 
  

2. CD into the webroot either using the alias you put into your `.bashrc`

        > cd/var/www/html
  
3. Clone the repo you want to develop

        > git clone <repopath>

4. Connect Exandrive

        server: localhost
        username: vagrant
        password: vagrant
        port: 2222
        remote path: /var/www/html
  
5. Create the Local Environment

This is an example for a laravel project.  The actual environment variables may vary based on project

        <?php

        return ['APP_ENV' => 'local',
            'DB_HOST' => 'localhost',
            'DB_NAME' => 'vhost-config',
            'DB_USERNAME' => 'root',
            'DB_PASSWORD' => ''];
      
6. Adjust permissions in places where files are updated

        > chmod -R a+w app/storage

7. Run Composer

        > composer install
  
8. Create project database(s)

9. Run migrations and seeds

10.Serve the application
This can be a path, a single file, or a vhost file

        > vm serve public
        

  

  
