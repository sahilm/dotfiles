#! /usr/bin/env bash

# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
    brew bundle --file=$DIR/brewfile
    brew upgrade
    brew cask outdated -q | xargs -I % brew cask reinstall %
    mas upgrade
    brew cleanup
    brew cask cleanup
}

# Setup dotfiles
mkdir -p $HOME/bin
find ${DIR} -name '.[^.DS_Store]*' -type f -depth 1 | xargs -I % ln -sf % $HOME
mkdir -p $HOME/.ssh
ln -sf ${DIR}/.ssh/config $HOME/.ssh/config


# brew stuff
brew_it
use_brewed_bash

chmod 0400 $HOME/Dropbox/creds/.ssh/id_rsa
ln -sf $HOME/Dropbox/creds/.ssh/id_rsa $HOME/.ssh/id_rsa
ln -sf $HOME/Dropbox/.bash_history $HOME/.bash_history

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
RUBY_VERSION="2.4.1"
if ! rbenv versions --bare | grep -q ${RUBY_VERSION}; then
    rbenv install ${RUBY_VERSION} --keep
fi

rbenv global 2.4.1

# Update all default gems
gem update --system
gem update
gem cleanup

# Setup workspace
mkdir -p $HOME/src
mkdir -p ${GOPATH}

# Update the npms
npm i npm -g
npm update -g
