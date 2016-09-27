#!/usr/bin/env bash
# sublime.sh - symlink sublime user settings and color scheme
# inspired by https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.osx

# Expand a path to an absolute path
function realpath {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

# change to sublime dir
cd "$HOME/Library/Application Support/Sublime Text 3/Packages"

# theme
ln -Ffs $HOME/osx-jump-start/configs/sublime/Dracula.tmTheme
# settings
cd "User"
ln -Ffs $HOME/osx-jump-start/configs/sublime/Preferences.sublime-settings
