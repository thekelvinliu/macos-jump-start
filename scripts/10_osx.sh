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
base="$HOME/osx-jump-start/configs/launchd"
path="$HOME/Library/LaunchAgents"
plist="com.thekelvinliu.ssh-adder.plist"
mkdir -p "$path"
echo "symlinking ssh-adder launch agent"
ln -Ffs "$base/$plist" "$path"
launchctl load "$path/$plist"

# dsnuke plist
path="/Library/LaunchAgents"
plist="com.thekelvinliu.dsnuke.plist"
mkdir -p "$path"
echo "symlinking dsnuke launch agent"
sudo ln -Ffs "$base/$plist" "$path"
sudo launchctl load "$path/$plist"

unset base path plist
