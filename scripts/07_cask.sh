#!/usr/bin/env bash
# 07_cask.sh - script to install homebrew cask and apps
# note: assumes homebrew is already installed -- if not, run 04_homebrew.sh

# enable install functions
. $HOME/osx-jump-start/scripts/00_install-functions.sh

# ensure homebrew is installed before continuing
if ! has_brew; then
    echo "homebrew is not installed -- exiting."
    return
fi

# ensure things are up-to-date
brew update

# install homebrew cask
brew_tap caskroom/cask
brew_tap caskroom/versions

# important
brew_cask_install alfred
brew_cask_install iterm2
brew_cask_install sublime-text
brew_cask_install google-chrome
brew_cask_install dropbox
brew_cask_install gpgtools
# brew_cask_install slack

# development-realted
brew_cask_install java
brew_cask_install xquartz
brew_cask_install osxfuse
brew_cask_install ngrok
brew_cask_install firefoxdeveloperedition
brew_cask_install safari-technology-preview
brew_cask_install arduino
# brew_cask_install sequel-pro
# brew_cask_install robomongo
brew_cask_install virtualbox
brew_cask_install virtualbox-extension-pack
# brew_cask_install vagrant

# tex
brew_cask_install basictex
brew_cask_install tex-live-utility

# general apps
brew_cask_install appcleaner
brew_cask_install coconutbattery
brew_cask_install cyberduck
brew_cask_install disk-inventory-x
brew_cask_install evernote
brew_cask_install flux
brew_cask_install skim
brew_cask_install skype
brew_cask_install the-unarchiver
brew_cask_install torbrowser
brew_cask_install tunnelblick

# media apps
brew_cask_install transmission
# use the latest app version of filebot that actually works
brew_cask_install https://raw.githubusercontent.com/caskroom/homebrew-cask/60531a2812005dd5f17dc92f3ce7419af3c5d019/Casks/filebot.rb
brew_cask_install vlc
brew_cask_install vox
brew_cask_install vox-preferences-pane
brew_cask_install imageoptim
# brew_cask_install handbrake
# brew_cask_install imagealpha

# games
brew_cask_install minecraft
brew_cask_install steam

# clean things up
brew cask cleanup
