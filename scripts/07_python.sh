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

# python
brew_install python@2
brew_install python

# homebrew libraries
brew_install ipython
brew_install numpy
brew_install scipy

# pip libraries
pip2_install six
pip2_install neovim
pip2_install requests

pip3_install six
pip3_install neovim
pip3_install requests

# clean things up
brew cleanup
