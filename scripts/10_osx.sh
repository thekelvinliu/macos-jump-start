#!/usr/bin/env bash
# 10_osx.sh - changes osx system settings

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true
# don't write .DS_Store to drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# allow tabs for modals
defaults write -g AppleKeyboardUIMode -int 3
# enable press and hold input
defaults write -g ApplePressAndHoldEnabled -bool true
# fast key repeat
defaults write -g KeyRepeat -int 1

# kill existing finder sessions
killall Finder

# launch agents
base="$HOME/osx-jump-start/configs/launchd"
# ssh-add plist
path="$HOME/Library/LaunchAgents"
plist="com.thekelvinliu.ssh-adder.plist"
mkdir -p "$path"
echo "symlinking ssh-adder launch agent"
launchctl unload "$path/$plist" 2> /dev/null
ln -Ffs "$base/$plist" "$path"
launchctl load "$path/$plist"
# dsnuke plist -- needs to be owned by root
path="/Library/LaunchAgents"
plist="com.thekelvinliu.dsnuke.plist"
mkdir -p "$path"
echo "symlinking dsnuke launch agent"
sudo launchctl unload "$path/$plist" 2> /dev/null
sudo chown root:wheel "$base/$plist"
sudo ln -Ffs "$base/$plist" "$path"
sudo launchctl load "$path/$plist"
# remove variables
unset base path plist
