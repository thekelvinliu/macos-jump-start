#!/usr/bin/env bash
# linker.sh - script to symlink bash-related dotfiles in this repo to ~/

# Expand a path to an absolute path
function realpath {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# loop through bash-related dotfiles
for file in ./dotfiles/bash/.[^.]*; do
    if [ -r $file ]; then
        file=$(realpath $file)
        (cd $HOME && ln -Ffs $file)
    fi
done
unset file
