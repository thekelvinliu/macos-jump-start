#!/usr/bin/env bash
# 10_osx.sh - changes osx system settings

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# don't write .DS_Store to network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 0

# kill existing finder sessions
killall Finder

# launch agents
# ssh-add plist
path="$HOME/Library/LaunchAgents"
mkdir -p "$path"
echo "symlinking ssh-adder launch agent"
ln -Ffs "$HOME/osx-jump-start/configs/launchd/com.thekelvinliu.ssh-adder.plist" "$path"
# dsnuke plist
path="/Library/LaunchAgents"
mkdir -p "$path"
echo "symlinking dsnuke launch agent"
sudo ln -Ffs "$HOME/osx-jump-start/configs/launchd/com.thekelvinliu.dsnuke.plist" "$path"
unset path
