#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment
# work in progress

#check for xcode
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
    #get colors
    . $HOME/osx-jump-start/dotfiles/.bash_profile

    #loop through scripts
    for file in $HOME/osx-jump-start/scripts/[0-9]*; do
        echo $'\nRunning'$ORANGE$file$RESET && . $file && sleep 2
    done
else
    echo "Follow the instructions-- install Xcode and agree to the liscence before doing this!"
fi
unset file un email
echo $GREEN$BOLD$'\nD O N E'$RESET" -- Enjoy developing on your new system! -- "$GREEN$BOLD$'D O N E\n'$RESET
