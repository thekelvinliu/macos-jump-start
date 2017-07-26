# installs homebrew's bash and sets it as the login shell

# get a common execution environment
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/common.sh"

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
brew_bash_path=$(which bash)

# change the default shell to homebrew-installed bash
if [[ "$SHELL" != "$brew_bash_path" ]]; then
  echo "changing the default shell -- you may need to enter your password"
  sudo chsh -s "$brew_bash_path" $(whoami)
else
  echo "the default shell is already homebrew's bash"
fi

# clean things up
brew cleanup
