source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export PROMPT_COMMAND='__git_ps1 "\w" " "'
export PATH=./bin:$HOME/bin:$HOME/.rbenv/bin:/usr/local/bin:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export JAVA_HOME=`/usr/libexec/java_home`
alias ls='ls -G'
alias ll='ls -laG'
alias la='ls -laG'
eval "$(rbenv init -)"
