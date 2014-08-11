if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi

# General environment command-line helpers
alias ll="ls -lah" # List all, with human readable filesizes
alias lf="ls -FC"
alias l="ls -ltr"
alias c="clear" # Typing the whole word is annoying
alias h="cd ~/" # Go home
alias web="cd /var/www/html" # Go to default webroot
alias phpmail="tail -f /tmp/php-mail"
alias githome="git rev-parse --show-toplevel"

# Artisan
alias art="php artisan"
alias artisan="php artisan"
alias par="php artisan routes"
alias pam="php artisan migrate"
alias pam:r="php artisan migrate:refresh"
alias pam:roll="php artisan migrate:rollback"
alias pam:rs="php artisan migrate:refresh --seed"
alias pda="php artisan dumpautoload"
alias cu="composer update"
alias ci="composer install"
alias cda="composer dump-autoload -o"

# Composer goes zooooom!
alias composer="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 /usr/bin/composer"

# Linting-related aliases
alias pfdr="php-cs-fixer fix --dry-run --verbose --diff"
alias pf="php-cs-fixer fix"

# Testing-related aliases
alias pu="clear && phpunit"
alias behat="behat --ansi"

function cept() {
  clear
  $(githome)/vendor/bin/codecept $*
}