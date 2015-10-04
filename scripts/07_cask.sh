#!/usr/bin/env bash
# cask.sh - script to install homebrew cask and apps
# Assumes homebrew is already installed. If not, run 04_homebrew.sh

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

#ensure things are up-to-date
brew update

#install homebrew cask
brew_install brew-cask
brew cask update

#install apps!
brew_cask_install java
brew_cask_install xquartz
brew_cask_install dropbox
brew_cask_install google-chrome
brew_cask_install iterm2
brew_cask_install sublime-text3
brew_cask_install skim
brew_cask_install virtualbox
brew_cask_install virtualbox-extension-pack
brew_cask_install vagrant
brew_cask_install flux
brew_cask_install sequel-pro
brew_cask_install robomongo
brew_cask_install javafx-scene-builder
brew_cask_install appcleaner
brew_cask_install disk-inventory-x
brew_cask_install coconutbattery
brew_cask_install skype
brew_cask_install slack
brew_cask_install cyberduck
brew_cask_install handbrake
brew_cask_install filebot
brew_cask_install transmission
brew_cask_install vlc
brew_cask_install steam
brew_cask_install evernote
#brew_cask_install tunnelblick cask version is a bit screwed up
brew_cask_install the-unarchiver
brew_cask_install rstudio
brew_cask_install minecraft
brew_cask_install imageoptim
brew_cask_install imagealpha

#clean things up
brew cask cleanup
