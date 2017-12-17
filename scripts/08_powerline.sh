# install powerline

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

# requirements
brew_install coreutils
brew_install socat
pip2_install psutil
pip2_install pyuv

# powerline
pip2_install powerline-status

# patched font
brew_cask_install font-roboto-mono-for-powerline
