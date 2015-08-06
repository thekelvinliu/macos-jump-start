#!/usr/bin/env bash
# setup.sh - script to install homebrew and configure development environment
# this is very-much-so a work in progress.

if which brew | grep -q /usr/local/bin/brew; then
    echo homebrew is already installed
else
    echo homebrew is not installed, checking for xcode-select
fi
