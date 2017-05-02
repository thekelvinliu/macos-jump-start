#!/usr/bin/env bash
# 08_pip.sh - script to install python libraries via pip
# note: assumes both versions of python are already installed
# if not, run 04_homebrew.sh

# enable install functions
. $HOME/osx-jump-start/scripts/00_install-functions.sh

# ensure homebrew is installed before continuing
# pip might be installed by default, but only accept homebrew's python :)
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

pip_install ipython && pip3_install ipython
pip_install requests && pip3_install requests
# pip_install Flask
