alias la='ls -AF'
alias l='ls -al'
alias ll='ls -al'
alias ls='ls -G'
alias remove_all_gems="gem uninstall -aIx"
alias hfix='history -n && history | sort -k2 -k1nr | uniq -f1 | sort -n | cut -c8- > ~/.tmp$$ && history -c && history -r ~/.tmp$$ && history -w && rm ~/.tmp$$'  

# Simple fn to http serve the $PWD
function serve() {
    local port=${1:-9000}
    ruby -run -e httpd . -p $port
}

# So that you can just type serve anywhere
export -f serve

# So that you can bootstrap from anywhere!
function bootstrap() {
    $HOME/src/dotfiles/machine_bootstrap.sh
}

export -f bootstrap

# when spotlight fails to index things
function reindex() {
  sudo mdutil -a -i off
  sudo mdutil -a -i on
}

export -f reindex
alias gyb='~/gyb/gyb'
