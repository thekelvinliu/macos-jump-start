#!/usr/bin/env bash
# osx.sh - changes osx system settings
# inspired by https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.osx

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# don't write .DS_Store to network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 0

# kill existing finder sessions
killall Finder
