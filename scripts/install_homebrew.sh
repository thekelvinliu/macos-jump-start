#!/usr/bin/env bash
# install_homebrew.sh - script to install homebrew

if which brew | grep -q /usr/local/bin/brew; then
    echo "homebrew is already installed"
else
    echo "homebrew is not installed, checking for xcode-select"
    if xcode-select -p 2>/dev/null; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        echo "install xcode before running this script!"
    fi
fi
