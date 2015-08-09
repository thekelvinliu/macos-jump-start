#!/usr/bin/env bash
# install_homebrew.sh - script to install homebrew

if [[ -n $(which brew) ]]; then
    echo "homebrew is already installed"
else
    echo "homebrew is not installed-- installing now!"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
fi
