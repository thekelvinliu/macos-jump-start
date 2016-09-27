#!/usr/bin/env bash
# 06_bash.sh - script to install bash via homebrew and set it as the login shell
# note: assumes homebrew is already installed -- if not, run 04_homebrew.sh

# enable install functions
. $HOME/osx-jump-start/scripts/00_install-functions.sh

# update formulae
brew update

# install bashf and bash-completion
brew_install bash
brew_install bash-completion
brew_bash_path=$(which bash)

# set login shell to /usr/local/bin/bash if it isn't
if [[ $SHELL != $brew_bash_path ]]; then
    if cat /etc/shells | grep -q $brew_bash_path; then
        echo /etc/shells already has $brew_bash_path
    else
        echo $brew_bash_path >> /etc/shells
    fi
    chsh -s $brew_bash_path
else
    echo "The login shell is already homebrew's bash"
fi

# clean things up
brew cleanup
