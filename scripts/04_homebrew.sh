#!/usr/bin/env bash
# 04_homebrew.sh - script to install hombrew, basic tools, python, and web stuff

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

# check doctor
brew doctor

# update formulae
brew update

# add other repos
brew_tap homebrew/python
brew_tap caskroom/cask
brew_tap caskroom/versions

# basics
brew_install coreutils
brew_install findutils
brew_install git
brew_install htop-osx
brew_install tree
brew_install ffmpeg
brew_install imagemagick
brew_install cmake

# python
brew_install python
brew linkapps python
brew_install python3
brew linkapps python3
brew_install "numpy --with-python3"
brew_install "scipy --with-python3"
brew_install "matplotlib --with-python3"
brew_install "pillow --with-python3"
# brew_install "pygame --with-python3"

# node
brew_install nvm
mkdir -p "$HOME/.nvm"
nvm install v6
nvm alias latest v6
nvm install v5
nvm alias default v5
nvm alias node default
nvm alias stable default
alias node_install_globals='npm i -g bower gulp npm-check-updates yo'
nvm use latest && node_install_globals
nvm use default && node_install_globals

# web
brew_install heroku
brew_install mysql
brew_install mongodb
brew_install sqlite

# other
# brew_install r
brew_install gnupg2
brew_install gpg-agent
brew_install pass

# clean things up
brew cleanup
