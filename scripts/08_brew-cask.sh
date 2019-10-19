#!/usr/bin/env bash
# install homebrew cask and apps

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# add more cask taps
brew_tap homebrew/cask-versions

# important
brew_cask_install alfred
brew_cask_install iterm2-beta
brew_cask_install kitty
brew_cask_install sublime-text
brew_cask_install dropbox
brew_cask_install safari-technology-preview
brew_cask_install spectacle

# development-related
brew_cask_install osxfuse
brew_cask_install xquartz

# brew_cask_install arduino
brew_cask_install docker
# brew_cask_install processing
# brew_cask_install sequel-pro
brew_cask_install virtualbox
brew_cask_install virtualbox-extension-pack

# other browsers
brew_cask_install firefox-developer-edition
brew_cask_install google-chrome-dev

# backups
brew_cask_install borgbackup
brew_cask_install google-drive-file-stream

# general apps
brew_cask_install appcleaner
# brew_cask_install coconutbattery
# brew_cask_install cyberduck
brew_cask_install disk-inventory-x
# brew_cask_install flux
# brew_cask_install slack
brew_cask_install the-unarchiver
# brew_cask_install torbrowser
brew_cask_install tunnelblick

# media apps
# install airflow version that actually works
# app=airflow
# if brew_cask_installed "$app"; then
#   echo -e "$BLUE$app$RESET is already installed."
# else
#   brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/633b0e5c327b2641241949dc3b82e73c379df957/Casks/airflow.rb
# fi
# brew_cask_install handbrake
# brew_cask_install imagealpha
# brew_cask_install imageoptim
brew_cask_install mpv
brew_cask_install spotify
brew_cask_install transmission
# brew_cask_install vlc
