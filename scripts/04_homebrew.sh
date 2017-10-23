# installs homebrew and useful basics

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

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
  return
fi

# run the doctor
brew doctor

# update formulae and upgrade (for existing installations of homebrew)
brew update
brew upgrade

# add some taps
brew_tap homebrew/science
brew_tap beeftornado/rmtree

# the basics
brew_install awscli
brew_install cmake
brew_install gcc
brew_install git
brew_install htop
brew_install tree
# brew_install coreutils
# brew_install findutils

# clean things up
brew cleanup
