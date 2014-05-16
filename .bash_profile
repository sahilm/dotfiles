# Enable bash completion
source $(brew --prefix)/etc/bash_completion
# Enable a fancy git prompt from brew's bash completion package
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
# Show unstaged(*) and unstaged(+) changes
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
# Add current working directory's bin, personal bin, rbenv's bin and brew's bin to the PATH
export PATH=./bin:$HOME/bin:$RBENV_ROOT/bin:/usr/local/bin:$PATH
# Enable rbenv
eval "$(rbenv init -)"
# English/UTF8 default
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# Set the latest Java as the JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home`
# -G colorizes stuff
alias ls='ls -G'
# Handy stuff
alias ll='ls -laG'
alias la='ls -laG'
# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# Remove duplicates from the history
export HISTCONTROL=ignoredups:erasedups
# Huge history
export HISTSIZE=1000000
export HISTFILESIZE=1000000
# Always append to the history
shopt -s histappend
# Neat trick to share history across terminal tabs/sessions
# history -a = append to history
# history -c = clear all history
# history -r = read the history file
# render the prompt
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done
