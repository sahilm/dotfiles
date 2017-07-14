alias l='ls -a'
alias la='ls -AF'
alias ll='ls -al'
alias ls='ls -G'
alias cdgo="cd $GOPATH"
alias mygo="cd $GOPATH/src/github.com/sahilm"
alias remove_all_gems="gem uninstall -aIx"

# Simple fn to http serve the $PWD
function serve() {
    local port=${1:-9000}
    ruby -run -e httpd . -p $port
}

# So that you can just type serve anywhere
export -f serve

# So that you can bootstrap from anywhere!
function bootstrap() {
    $HOME/src/dotfiles/machine_boostrap.sh
}

export -f bootstrap
