#!/usr/bin/env bash
# 05_vim.sh - script to install vim, pathogen, and some plugins

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

#basics
brew_install coreutils
brew_install findutils
brew_install git
brew_install htop
brew_install tree
brew_install ffmpeg
brew_install imagemagick

#python
brew_install python
brew_install python3
brew linkapps
brew_install "numpy --with-python3"
brew_install "scipy --with-python3"
brew_install "matplotlib --with-python3"
brew_install "pygame --with-python3"

#web
brew_install node
brew_install heroku-toolbelt
brew_install mysql
brew_install mongodb

#clean things up
brew cleanup
