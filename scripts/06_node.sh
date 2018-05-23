# install nvm, node, and some global packages

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

# nvm and yarn
brew_install nvm
brew_install "yarn --without-node"

# set up nvm now
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
. $(brew --prefix nvm)/nvm.sh

# default globals
cat <<EOF > "$NVM_DIR/default-packages"
neovim
npm-check-updates-lite
serve
serverless
tern
EOF

# install latest lts and version
nvm install --lts --latest-npm
nvm install node --latest-npm

# clean things up
brew cleanup
