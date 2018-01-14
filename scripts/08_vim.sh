# install vim and plugs

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

# install vim
brew_install "vim --with-python3"

# patched font
brew_cask_install font-roboto-mono-for-powerline

# clean things up
brew cleanup
