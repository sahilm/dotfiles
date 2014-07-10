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
export PATH=./bin:./node_modules/.bin:$HOME/bin:$RBENV_ROOT/bin:/usr/local/bin:$PATH
export PAGER=less
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

source $(brew --prefix)/etc/bash_completion
# Enable a fancy git prompt from brew's bash completion package
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
# Enable completion-ruby
source $HOME/.completion-ruby/completion-ruby-all
# Enable direnv
eval "$(direnv hook $0)"

# See http://unix.stackexchange.com/a/18443
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
# nocaseglob: case-insensitive globbing (used in pathname expansion)
# cdspell: autocorrect typos in path names when using cd
# histappend: Always append to the history
# autocd: e.g. `**/qux` will enter `./foo/bar/baz/qux`
# globstart: Recursive globbing, e.g. `echo **/*.txt`
for option in nocaseglob cdspell autocd globstar; do
  shopt -s "$option" 2> /dev/null
done
