# installs homebrew cask and apps

# get a common execution environment
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# install homebrew cask
brew_tap caskroom/cask
brew_tap caskroom/versions

# important
brew_cask_install alfred
brew_cask_install iterm2
brew_cask_install sublime-text-dev
brew_cask_install dropbox
brew_cask_install safari-technology-preview

# development-related
brew_cask_install java
brew_cask_install xquartz
brew_cask_install osxfuse
brew_cask_install ngrok
brew_cask_install virtualbox
brew_cask_install virtualbox-extension-pack
# brew_cask_install vagrant
# brew_cask_install arduino
# brew_cask_install processing
# brew_cask_install gpgtools

# other browsers
brew_cask_install firefoxdeveloperedition
brew_cask_install google-chrome

# tex
brew_cask_install basictex
brew_cask_install tex-live-utility

# database clients
# brew_cask_install sequel-pro
# brew_cask_install robomongo

# general apps
brew_cask_install appcleaner
brew_cask_install coconutbattery
# brew_cask_install cyberduck
brew_cask_install disk-inventory-x
brew_cask_install evernote
brew_cask_install flux
brew_cask_install skim
# brew_cask_install skype
# brew_cask_install slack
brew_cask_install the-unarchiver
brew_cask_install torbrowser
brew_cask_install tunnelblick

# media apps
# a filebot that actually works
app=filebot
if brew_cask_installed $app; then
  echo "$BLUE$app$RESET is already installed."
else
  brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/60531a2812005dd5f17dc92f3ce7419af3c5d019/Casks/filebot.rb
fi
unset app
# brew_cask_install handbrake
# brew_cask_install imageoptim
# brew_cask_install imagealpha
brew_cask_install transmission
brew_cask_install vlc
# brew_cask_install vox
# brew_cask_install vox-preferences-pane

# games
# brew_cask_install minecraft
# brew_cask_install steam

# clean things up
brew cask cleanup
