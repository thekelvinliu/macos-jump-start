# install homebrew's bash and set it as the login shell

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

# install bash and bash-completion
brew_install bash
brew_install bash-completion@2

# change shell if necessary
brew_bash_path=$(which bash)
shells="/etc/shells"
if [[ "$SHELL" == "$brew_bash_path" ]]; then
  echo "the default shell is already homebrew's bash"
else
  echo "changing the default shell -- you may need to enter your password"
  # put homebrew's bash in /etc/shells
  fgrep -qsx "$brew_bash_path" "$shells" || echo "$brew_bash_path" | sudo tee -a "$shells" > /dev/null
  # set as default shell
  sudo chsh -s "$brew_bash_path" $(whoami)
  echo "restart your shell to use homebrew's bash"
fi
unset brew_bash_path shells

# clean things up
brew cleanup
