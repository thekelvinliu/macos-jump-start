#!/usr/bin/env bash
# homebrew.sh - script to install hombrew and basic tools

# Installs a homebrew formula
function brew_install {
    if brew_installed $1; then
        echo "$GREEN$1$RESET is already installed."
    else
        brew install $1
    fi
}

# Checks whether given formula is already installed
function brew_installed {
    brew list -1 | fgrep -qx $1
}

# Taps a homebrew repo
function brew_tap {
    if brew_tapped $1; then
        echo "$GREEN$1$RESET is already tapped."
    else
        brew tap $1
    fi
}

# Checks whether given repo is already tapped
function brew_tapped {
    brew tap | fgrep -qx $1
}

if [[ -n $(which brew) ]]; then
    echo "homebrew is already installed"
else
    echo "homebrew is not installed-- installing now!"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

#check doctor
brew doctor

#update formulae
brew update

#add other repos
brew_tap homebrew/python
brew_tap caskroom/cask
brew_tap caskroom/versions

#general stuff
brew_install coreutils
brew_install findutils
brew_install git

#bash

#vim
brew_install vim
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible
git clone https://github.com/jiangmiao/auto-pairs.git $HOME/.vim/bundle/auto-pairs

#python
brew_install python
brew_install python3
brew linkapps
brew_install "numpy --with-python3"
brew_install "scipy --with-python3"
brew_install "matplotlib --with-python3"
# brew_install "pygame --with-python3"

#web
brew_install node
brew_install heroku-toolbelt
brew_install mysql
brew_install mongodb

#clean things up
brew cleanup
