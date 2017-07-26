# installs nvm, node, and some global packages

# get a common execution environment
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/common.sh"
. "$OJS/dotfiles/.aliases"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# node
brew_install nvm

# set up nvm now
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
. $(brew --prefix nvm)/nvm.sh

# install latest version of node
nvm install node

# update npm and install global packages
npm i -g npm
install-npm-globals

# clean things up
brew cleanup
