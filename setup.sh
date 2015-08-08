#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment
# work in progress

#clone full git repository
cd $HOME
git clone https://github.com/thekelvinliu/osx-jump-start.git

#loop through scripts
for file in $HOME/osx-jump-start/scripts/{linker.sh,ssh.sh,install_homebrew.sh,osx.sh}; do
    [ -r "$file" ] && . "$file"
done
unset file
