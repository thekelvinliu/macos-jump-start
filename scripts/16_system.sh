# change osx system settings

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

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