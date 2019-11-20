export BASH_SILENCE_DEPRECATION_WARNING=1

# Show unstaged(*) and staged(+) changes
export GIT_PS1_SHOWDIRTYSTATE=1
# Show stashes($)
export GIT_PS1_SHOWSTASHSTATE=1
# Show untracked(%) files
export GIT_PS1_SHOWUNTRACKEDFILES=1
# Colorize the prompt
export GIT_PS1_SHOWCOLORHINTS=1

# Show our fancy prompt!
export PROMPT_COMMAND='__git_ps1 "\W" " "'

# Set the RBENV root env var
export RBENV_ROOT=$HOME/.rbenv

# Set GOPATH
export GOPATH=$HOME/src/go
export PATH="$HOME/bin:./bin:./node_modules/.bin:$RBENV_ROOT/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin:/usr/local/opt/python/libexec/bin:$PATH"
export PAGER=less
export EDITOR=vim

# Enable rbenv
eval "$(rbenv init -)"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export JAVA_HOME=$(/usr/libexec/java_home)

# Enable Bash completion
source $(brew --prefix)/etc/bash_completion
# Enable a fancy git prompt from brew's bash completion package
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
# aws completion
complete -C '/usr/local/bin/aws_completer' aws
# gcloud completion
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
# Enable direnv
eval "$(direnv hook $0)"
# Set tab width to 4
tabs -4

# setup fasd
eval "$(fasd --init auto)"

# Init fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# source all aliases
. $HOME/.bash_aliases

# Alias git to hub
eval "$(hub alias -s)"

export HISTCONTROL=ignoredups:erasedups
# Infinite history
# http://superuser.com/a/479727
export HISTSIZE=""
# export PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# clear dupes in history
hfix

shopt -s histappend
