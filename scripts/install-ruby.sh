#!/usr/bin/env bash

if [[ ! -d '/.kraken-stuff' ]]; then
    mkdir '/.kraken-stuff'
    echo 'Created directory /.kraken-stuff'
fi

if [[ -f '/.kraken-stuff/install-ruby' ]]; then
    exit 0
fi

echo 'Installing Ruby 1.9.3 using Ruby environment manager...'

curl -sSL https://get.rvm.io | bash -s stable --quiet-curl --ruby=1.9.3
source /usr/local/rvm/scripts/rvm

if [[ -f '/usr/bin/ruby' ]]; then
    mv /usr/bin/ruby /usr/bin/ruby-old
fi

if [[ -f '/usr/bin/gem' ]]; then
    mv /usr/bin/gem /usr/bin/gem-old
fi

ln -s /usr/local/rvm/rubies/ruby-1.9.3-p*/bin/ruby /usr/bin/ruby
ln -s /usr/local/rvm/rubies/ruby-1.9.3-p*/bin/gem /usr/bin/gem

usermod -a -G rvm vagrant
/usr/bin/gem install puppet --no-document >/dev/null
/usr/bin/gem install librarian-puppet --no-document >/dev/null
/usr/bin/gem update --system >/dev/null

touch '/.kraken-stuff/install-ruby'

echo 'Finished install Ruby 1.9.3 using Ruby environment manager...'