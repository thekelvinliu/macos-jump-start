#!/usr/bin/env bash
# homebrew.sh - script to install hombrew and tools + homebrew cask and apps

# Installs a homebrew cask formula
function brew_cask_install {
    if brew_cask_installed $1; then
        echo "$GREEN$1$RESET is already installed."
    else
        brew cask install $1
    fi
}

# Checks whether given app is already installed
function brew_cask_installed {
    brew cask list -1 | fgrep -qx $1
}

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
brew_install git
brew_install vim

#python
brew_install python
brew_install python3
brew_install "numpy --with-python3"
brew_install "scipy --with-python3"
brew_install "matplotlib --with-python3"
# brew_install "pygame --with-python3"

#web
brew_install node
brew_install heroku-toolbelt
brew_install mysql
brew_install mongodb

#homebrew cask
brew_install brew-cask
# brew_cask_install java
brew_cask_install xquartz
brew_cask_install google-chrome
brew_cask_install iterm2
# brew_cask_install sublime-text3
brew_cask_install flux
brew_cask_install sequel-pro
brew_cask_install robomongo
brew_cask_install javafx-scene-builder
brew_cask_install appcleaner
brew_cask_install disk-inventory-x
brew_cask_install coconutbattery
brew_cask_install skype
brew_cask_install cyberduck
brew_cask_install handbrake
brew_cask_install filebot
brew_cask_install transmission
brew_cask_install vlc
brew_cask_install steam
