# installs vim, pathogen, and plugins

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

# install vim
brew_install vim

# install pathogen
mkdir -p "$HOME/.vim/autoload" "$HOME/.vim/bundle"
if [[ ! -e "$HOME/.vim/autoload/pathogen.vim" ]]; then
  curl -LSso "$HOME/.vim/autoload/pathogen.vim" https://tpo.pe/pathogen.vim
else
  echo "${BLUE}pathogen$RESET is already installed."
fi

# install plugins
# auto-pairs
if [[ ! -e "$HOME/.vim/bundle/auto-pairs" ]]; then
  git clone https://github.com/jiangmiao/auto-pairs.git "$HOME/.vim/bundle/auto-pairs"
else
  echo "${BLUE}auto-pairs$RESET is already installed."
fi

# vim-sensible
if [[ ! -e "$HOME/.vim/bundle/vim-sensible" ]]; then
  git clone https://github.com/tpope/vim-sensible.git "$HOME/.vim/bundle/vim-sensible"
else
  echo "${BLUE}vim-sensible$RESET is already installed."
fi

# clean things up
brew cleanup
