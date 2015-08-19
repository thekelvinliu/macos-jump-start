#!/usr/bin/env bash
# linker.sh - script to symlink bash-related dotfiles in this repo to ~/

# Source functions dotfile to get realpath, sour
. $HOME/osx-jump-start/dotfiles/.functions

# loop through bash-related dotfiles
for file in $HOME/osx-jump-start/dotfiles/.[^.]*; do
    if [ -r "$file" ]; then
        file=$(realpath $file)
        if [[ $file =~ .gitconfig ]]; then
            cat $file | sed "s#_un#$un#g;s#_email#$email#g;s#_HOME#$HOME#g" > $HOME/.gitconfig
        else
            (cd $HOME && ln -Ffs $file)
        fi
    fi
done
unset file
. $HOME/.bash_profile && echo $PURPLE"sourced ~/.bash_profile"$RESET
echo $PURPLE"dotfiles linked."$RESET
