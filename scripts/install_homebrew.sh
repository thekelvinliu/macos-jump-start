#!/usr/bin/env bash
# install_homebrew.sh - script to install homebrew

if [[ -n $(which brew) ]]; then
    echo "homebrew is already installed"
else
    echo "homebrew is not installed, checking for xcode"
    if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew doctor
    else
        echo "install xcode before running this script!"
    fi
fi
