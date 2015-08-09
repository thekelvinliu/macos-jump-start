#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment
# work in progress

#check for xcode
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
    #clone full git repo
    cd $HOME
    git clone https://github.com/thekelvinliu/osx-jump-start.git
else
    echo "Follow the instructions-- install Xcode and agree to the liscence before doing this!"
fi

#loop through scripts
for file in $HOME/osx-jump-start/scripts/{linker.sh,ssh.sh,install_homebrew.sh,osx.sh}; do
    [ -r "$file" ] && . "$file"
done
unset file
