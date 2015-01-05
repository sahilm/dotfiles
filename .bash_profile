# Show unstaged(*) and staged(+) changes
export GIT_PS1_SHOWDIRTYSTATE=1
# Show stashes($)
export GIT_PS1_SHOWSTASHSTATE=1
# Show untracked(%) files
export GIT_PS1_SHOWUNTRACKEDFILES=1
# Colorize the prompt
export GIT_PS1_SHOWCOLORHINTS=1
# Use PROMPT_COMMAND instead of setting PS1. Only way to get a colorized prompt with git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\w" " "'
# Set the RBENV root env var
export RBENV_ROOT=$HOME/.rbenv
export PATH="$HOME/bin:./bin:./node_modules/.bin:$HOME/Library/Haskell/bin:$RBENV_ROOT/bin:$PATH"
export PAGER=less
export EDITOR=vim
# Enable rbenv
eval "$(rbenv init -)"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Set the latest Java as the JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`
alias ls='ls -G'
alias ll='ls -laG'
alias l='ll'
alias la='ll'
function serve() {
  local port=${1:-9000}
  ruby -run -e httpd . -p $port
}
alias serve=serve
source $(brew --prefix)/etc/bash_completion
# Enable a fancy git prompt from brew's bash completion package
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
# Enable direnv
eval "$(direnv hook $0)"
