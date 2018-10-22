#!/usr/bin/env bash
# install python and core scientific libraries

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# check whether a python library is installed with pip3
pip3_installed() {
  pip3 show "$1" &> /dev/null
}

# install a python library with pip3
pip3_install() {
  if pip3_installed "$1"; then
    echo -e "$BLUE$1$RESET is already installed."
  else
    pip3 install "$1"
  fi
}

# python
brew_install python@2
brew_install python

# homebrew python libraries
brew_install ipython
brew_install numpy
brew_install scipy

# pip python libraries
pip3_install flake8
pip3_install isort
pip3_install neovim-remote
pip3_install pip-autoremove
pip3_install pynvim
pip3_install virtualenv
pip3_install yapf
