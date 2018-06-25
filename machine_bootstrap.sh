#! /usr/bin/env bash

# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function setup_service() {
  ln -sf $1 $HOME/Library/LaunchAgents
  launchctl load -w $1 &>/dev/null
}

export -f setup_service

function use_brewed_bash() {
    local brew_bash="$(brew --prefix)/bin/bash"
    if ! grep -q ${brew_bash} /etc/shells; then
        sudo bash -c "echo $brew_bash >> /etc/shells"
    fi

    if ! which bash | grep -q ${brew_bash}; then
        sudo chsh -s "$brew_bash" ${USER}
    fi
}

# Installs brew and keeps all brews up-to-date
function brew_it() {
    which brew &>/dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap Homebrew/bundle
    brew update
    brew bundle --file=$DIR/brewfile
    brew upgrade
    brew cask outdated -q | xargs -I % brew cask reinstall %
    mas upgrade
    brew cleanup
    brew cask cleanup
}

# Setup dotfiles
mkdir -p $HOME/bin
find ${DIR} -name '.*' -type f -depth 1 | grep -v .DS_Store | xargs -I % ln -sf % $HOME
mkdir -p $HOME/.ssh
ln -sf ${DIR}/.ssh/config $HOME/.ssh/config

mkdir -p $HOME/.vim
ln -sf ${DIR}/vim-colorschemes $HOME/.vim/colors
ln -sf ${DIR}/vim-autoload $HOME/.vim/autoload

# Setup services
# find ${DIR}/services/*.plist -type f | xargs -n 1 -I {} bash -c 'setup_service "$@"' _ {}

# brew stuff
brew_it
use_brewed_bash

. $HOME/.bash_profile &> /dev/null

# Setup Docker Machine
(docker-machine ls | grep -q default) || docker-machine create default --driver virtualbox

# Setup Docker Machine NFS for super fast volume mounts
if docker-machine status | grep -q 'Running'; then
    docker-machine-nfs default
fi

# Gems to install by default on any new Ruby. See rbenv-default-gems
ln -sf ${DIR}/default-gems $(rbenv root)/default-gems

# Get Ruby on the box
RUBY_VERSION="2.5.1"
if ! rbenv versions --bare | grep -q ${RUBY_VERSION}; then
    rbenv install ${RUBY_VERSION} --keep
fi

rbenv global 2.5.1

# Update all default gems
gem update --system
gem update
gem cleanup

# Setup workspace
mkdir -p $HOME/src
mkdir -p ${GOPATH}
