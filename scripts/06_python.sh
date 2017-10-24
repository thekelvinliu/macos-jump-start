# installs python and python3 as well as some useful libraries

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# checks whether a given library is already installed with pip2
function pip2_installed {
  pip2 show "$1" &> /dev/null
}

# installs a python library with pip2
function pip2_install {
  if pip2_installed "$1"; then
    echo "$BLUE$1$RESET is already installed."
  else
    pip2 install "$1"
  fi
}

# checks whether a given library is already installed with pip3
function pip3_installed {
  pip3 show "$1" &> /dev/null
}

# installs a python library with pip3
function pip3_install {
  if pip3_installed "$1"; then
    echo "$BLUE$1$RESET is already installed."
  else
    pip3 install "$1"
  fi
}

# python
brew_install python
brew_install python3

# homebrew libraries
# brew_install ipython
brew_install numpy
brew_install scipy
brew_install matplotlib
# brew_install pillow

# pip libraries
# pip2_install Flask
pip2_install ipython
pip2_install requests
pip3_install ipython
pip3_install requests

# clean things up
brew cleanup
