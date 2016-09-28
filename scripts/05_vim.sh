#!/usr/bin/env bash
# 05_vim.sh - script to install vim, pathogen, and some plugins
# note: assumes homebrew is already installed -- if not, run 04_homebrew.sh

# enable install functions
. $HOME/osx-jump-start/scripts/00_install-functions.sh

# ensure homebrew is installed before continuing
if [ ! has_brew ]; then
    echo "homebrew is not installed -- exiting."
    return
fi

# update formulae
brew update

# install vim
brew_install vim

# install pathogen
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
if [[ ! -e $HOME/.vim/autoload/pathogen.vim ]]; then
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# install plugins
# vim-sensible
if [[ ! -e $HOME/.vim/bundle/vim-sensible ]]; then
    git clone https://github.com/tpope/vim-sensible.git $HOME/.vim/bundle/vim-sensible
fi

# auto-pairs
if [[ ! -e $HOME/.vim/bundle/auto-pairs ]]; then
    git clone https://github.com/jiangmiao/auto-pairs.git $HOME/.vim/bundle/auto-pairs
fi

# clean things up
brew cleanup
