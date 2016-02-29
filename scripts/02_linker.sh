#!/usr/bin/env bash
# 02_linker.sh - script to symlink bash-related dotfiles in this repo to ~/

# Expand a path to an absolute path
function realpath {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

#check for $un and $email, if either is undefined, run 01_prompt.sh
if [[ -z $un || -z $email ]]; then
    echo Missing username and/or password!
    . $HOME/osx-jump-start/scripts/01_prompt.sh
fi

# loop through bash-related dotfiles
for file in $HOME/osx-jump-start/dotfiles/.[^.]*; do
    if [ -r "$file" ]; then
        file=$(realpath $file)
        #insert username and email into gitconfig
        if [[ $file =~ .gitconfig ]]; then
            cat $file | sed "s#_un#$un#g;s#_email#$email#g;s#_HOME#$HOME#g" > $HOME/.gitconfig
        #otherwise, just symlink
        else
            (cd $HOME && ln -Ffs $file)
        fi
    fi
done
unset file
. $HOME/.bash_profile && echo $PURPLE"sourced ~/.bash_profile"$RESET
echo $PURPLE"dotfiles linked."$RESET
