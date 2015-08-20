#!/usr/bin/env bash
# 05_vim.sh - script to install vim, pathogen, and some plugins
# Assumes homebrew is already installed. If not, run 04_homebrew.sh

# Installs a homebrew formula
function brew_install {
    if brew_installed $1; then
        echo "$GREEN$1$RESET is already installed."
    else
        brew install $1
    fi
}

# Checks whether given formula is already installed
function brew_installed {
    brew list -1 | fgrep -qx $1
}

#update formulae
brew update

#install vim
brew_install vim

#install pathogen
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
if [[ ! -e $HOME/.vim/autoload/pathogen.vim ]]; then
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

#install plugins
#vim-sensible
if [[ ! -e $HOME/.vim/bundle/vim-sensible ]]; then
    git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible
fi

#auto-pairs
if [[ ! -e $HOME/.vim/bundle/auto-pairs ]]; then
    git clone https://github.com/jiangmiao/auto-pairs.git $HOME/.vim/bundle/auto-pairs
fi

#clean things up
brew cleanup
