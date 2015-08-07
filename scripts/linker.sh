#!/usr/bin/env bash
# linker.sh - script to symlink bash-related dotfiles in this repo to ~/

# Source functions dotfile to get realpath, sour
. $HOME/osx-jump-start/dotfiles/.functions

# loop through bash-related dotfiles
for file in $HOME/osx-jump-start/dotfiles/.[^.]*; do
    if [ -r $file ]; then
        file=$(realpath $file)
        (cd $HOME && ln -Ffs $file)
    fi
done
unset file
echo $PURPLE"dotfiles linked."$RESET
exec bash -l
