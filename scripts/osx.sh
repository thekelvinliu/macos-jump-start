#!/usr/bin/env bash
# osx.sh - changes osx system settings
# inspired by https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.osx

#show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true

#fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 0
