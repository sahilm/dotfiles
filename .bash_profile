source $(brew --prefix)/etc/bash_completion
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
export PROMPT_COMMAND='__git_ps1 "\w" " "'
export RBENV_ROOT=$HOME/.rbenv
export PATH=./bin:$HOME/bin:$RBENV_ROOT/bin:/usr/local/bin:$PATH
eval "$(rbenv init -)"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export JAVA_HOME=`/usr/libexec/java_home`
alias ls='ls -G'
alias ll='ls -laG'
alias la='ls -laG'
shopt -s nocaseglob

export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1000000
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

shopt -s cdspell
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done
