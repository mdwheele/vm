if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -f ~/.git-completion.bash ]; then
    # Git command completion.
    source ~/.git-completion.bash
fi

# Alias for using HipHop VM to run composer.
alias composer="hhvm -v ResourceLimit.SocketDefaultTimeout=30 -v Http.SlowQueryThreshold=30000 /usr/bin/composer"