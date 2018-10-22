#!/usr/bin/env bash
# install homebrew and useful basics

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# check for homebrew and install if necessary
if has_brew; then
  echo "homebrew is already installed"
else
  echo "homebrew is not installed -- installing now!"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# check for homebrew again in case user did not install
if ! has_brew; then
  echo "homebrew is still not installed -- exiting."
  exit 1
fi

# run the doctor
brew doctor

# update formulae and upgrade (for existing installations of homebrew)
brew update
brew upgrade

# the basics
brew_install abduco
brew_install coreutils
brew_install fd
brew_install fzf
brew_install git
brew_install htop
brew_install ripgrep
brew_install tree

# rmtree
brew_tap beeftornado/rmtree
