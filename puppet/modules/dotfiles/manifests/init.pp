class dotfiles {

    exec { "merge_files" :
        cwd => "/home/vagrant",
        command => 'yes | cp -R /vagrant/files/dotfiles/.[!.]* ./ && cp -R /vagrant/puppet/modules/dotfiles/files/.[!.]* ./ && for file in /vagrant/files/dotfiles/.[!.]*; do if [ $(basename $file) != ".gitignore" ]; then cp -f $(basename $file) /tmp/$(basename $file) && cat /tmp/$(basename $file) /vagrant/files/dotfiles/$(basename $file) > $(basename $file) ; fi ; done',
    }

}