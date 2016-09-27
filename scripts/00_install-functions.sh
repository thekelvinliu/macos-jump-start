#!/usr/bin/env bash
# install-functions.sh - script to install homebrew cask and apps
# note: this script only defines functions for installing stuff in a nice way

# check whether a given cask is already installed
function brew_cask_installed {
    brew cask list -1 | fgrep -qx $1
}

# install a cask formula
function brew_cask_install {
    if brew_cask_installed $1; then
        echo "$BLUE$1$RESET is already installed."
    else
        brew cask install $1
    fi
}

# check whether a given formula is already installed
function brew_installed {
    brew list -1 | fgrep -qx $1
}

# install a homebrew formula
function brew_install {
    if brew_installed $1; then
        echo "$BLUE$1$RESET is already installed."
    else
        brew install $1
    fi
}

# check whether a given tap is already tapped
function brew_tapped {
    brew tap | fgrep -qx $1
}

# taps a homebrew tap
function brew_tap {
    if brew_tapped $1; then
        echo "$BLUE$1$RESET is already tapped."
    else
        brew tap $1
    fi
}

# check whether a given library is already installed with pip
function pip_installed {
    pip freeze --local | fgrep -q $1
}

# installs a python library with pip
function pip_install {
    if pip_installed $1; then
        echo "$BLUE$1$RESET is already installed."
    else
        pip install $1
    fi
}

# check whether a given library is already installed with pip3
function pip3_installed {
    pip3 freeze --local | fgrep -q $1
}

# installs a python library with pip3
function pip3_install {
    if pip3_installed $1; then
        echo "$BLUE$1$RESET is already installed."
    else
        pip3 install $1
    fi
}
