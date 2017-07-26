# installs python and python3 as well as some useful libraries

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
