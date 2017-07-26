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
plist="com.thekelvinliu.ssh-adder.plist"
path="$HOME/Library/LaunchAgents"
mkdir -p "$path"
echo "symlinking ssh-adder launch agent"
launchctl unload "$path/$plist" 2> /dev/null
ln -Ffs "$base/$plist" "$path"
launchctl load "$path/$plist"
# remove variables
unset base path plist
