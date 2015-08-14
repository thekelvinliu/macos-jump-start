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

#get github username, email
while true; do
    read -p "Enter your github username: " un
    read -p "Your github username is $GREEN$un$RESET. Is this correct-- yes or no? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) :;;
        * ) echo "Please answer yes or no.";;
    esac
done
while true; do
    read -p "Enter your email: " email
    read -p "Your email is $GREEN$email$RESET. Is this correct-- yes or no? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) :;;
        * ) echo "Please answer yes or no.";;
    esac
done

#loop through scripts
for file in $HOME/osx-jump-start/scripts/{linker.sh,ssh.sh,homebrew.sh,pip.sh,osx.sh}; do
    [ -r "$file" ] && . "$file"
done
unset file un email
