#!/usr/bin/env bash
# sublime.sh - symlink sublime user settings and color scheme
# inspired by https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.osx

# change to sublime dir
cd "$HOME/Library/Application Support/Sublime Text 3/Packages"

# symlink theme
ln -Ffs $HOME/osx-jump-start/configs/sublime/Dracula.tmTheme

# symlink other settings
cd "User"
for file in $HOME/osx-jump-start/configs/sublime/*.sublime-settings; do
  ln -Ffs "$file"
done
