#!/usr/bin/env bash
# install ipython and some pip packages

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

# python3 with unversioned symlinks
brew_install python
ln -Ffs /usr/local/bin/python3 /usr/local/bin/python
ln -Ffs /usr/local/bin/pip3 /usr/local/bin/pip

# pip packages
pip3_install black
pip3_install flake8
pip3_install ipython
pip3_install isort
pip3_install jedi
pip3_install jupyterlab
pip3_install neovim-remote
pip3_install pip-autoremove
pip3_install pynvim
