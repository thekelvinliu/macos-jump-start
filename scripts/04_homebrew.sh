# installs homebrew and some useful basics

# 04_homebrew.sh - script to install hombrew, basic tools, python, and web stuff

# enable install functions
. $HOME/osx-jump-start/scripts/00_install-functions.sh

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

# basics
brew_install coreutils
brew_install findutils
brew_install git
brew_install htop-osx
brew_install tree
brew_install ffmpeg
brew_install imagemagick
brew_install cmake
brew_install ondir

# python
# maybe change pip.sh to python.sh and move this stuff
brew_install python
brew_install python3
brew_install "numpy --with-python3"
brew_install "scipy --with-python3"
brew_install "matplotlib --with-python3"
# brew_install "pillow --with-python3"
# brew_install "pygame --with-python3"

# node
brew_install nvm
# enable nvm immediately
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
. $(brew --prefix nvm)/nvm.sh
nvm install node
# update npm and install globals
npm i -g npm
npm i -g gulp-cli npm-check-updates serverless yarn yo

# databases
# brew_install mysql
# brew services start mysql
# brew_install mongodb
# brew services start mongodb
brew_install sqlite

# other
brew_install awscli
# brew_install go
brew_install pass

# clean things up
brew cleanup
