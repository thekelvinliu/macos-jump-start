#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment
# work in progress

#check for xcode
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
    #loop through scripts
    for file in $HOME/osx-jump-start/scripts/{prompt.sh,linker.sh,ssh.sh,homebrew.sh,pip.sh,osx.sh}; do
        [ -r "$file" ] && . "$file"
    done
else
    echo "Follow the instructions-- install Xcode and agree to the liscence before doing this!"
fi
unset file un email
