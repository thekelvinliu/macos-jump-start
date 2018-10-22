#!/usr/bin/env bash
# change osx system settings

# # general
# # appearance: dark
# defaults write -g AppleInterfaceStyle "Dark"
# # accent color: graphite
# defaults write -g AppleAccentColor -int -1
# defaults write -g AppleAquaColorVariant -int 6
# # highlight color: graphite
# defaults write -g AppleHighlightColor "0.847059 0.847059 0.862745 Graphite"
# # sidebar icon size: small
# defaults write -g NSTableViewDefaultSizeMode -int 1
# # auto hide menu bar: check
# defaults write -g _HIHideMenuBar -bool true
# # show scroll bars: when scrolling
# defaults write -g AppleShowScrollBars "WhenScrolling"
# # click scroll bar: jump to the spot
# defaults write -g AppleScrollerPagingBehavior -bool true

# show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles -bool true
# don't write .DS_Store to drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# allow tabs for modals
defaults write -g AppleKeyboardUIMode -int 3
# disable press and hold input
defaults write -g ApplePressAndHoldEnabled -bool false
# fast key repeat
defaults write -g KeyRepeat -int 1

# https://ss64.com/osx/syntax-defaults.html
# add 'save as...' to menus
defaults write -g NSUserKeyEquivalents -dict-add 'Save As...' '@$S'
# save to disk by default
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false

# kill existing finder sessions
killall Finder
