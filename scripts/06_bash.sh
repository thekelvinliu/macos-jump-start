#!/usr/bin/env bash
# 06_bash.sh - script to install bash via homebrew and set it as the login shell
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

#install bash
brew_install bash
brew_bash_path=$(which bash)

#set login shell to /usr/local/bin/bash if it isn't
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

#clean things up
brew cleanup
