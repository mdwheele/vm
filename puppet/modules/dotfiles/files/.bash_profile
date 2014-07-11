if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi

alias composer="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 /usr/bin/composer"
alias pfdr="php-cs-fixer fix --dry-run --verbose --diff"
alias pf="php-cs-fixer fix"
alias behat="behat --ansi"

