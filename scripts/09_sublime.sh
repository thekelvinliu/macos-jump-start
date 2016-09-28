#!/usr/bin/env bash
# 09_sublime.sh - symlink sublime user settings and color scheme

# ensure directory stucture exists
sublime_dir="$HOME/Library/Application Support/Sublime Text 3/Packages"
mkdir -p "$sublime_dir/User"

# change to sublime directory
cd "$sublime_dir"

# symlink theme
ln -Ffs $HOME/osx-jump-start/configs/sublime/Dracula.tmTheme

# symlink other settings
cd "User"
for file in $HOME/osx-jump-start/configs/sublime/*.sublime-settings; do
    ln -Ffs "$file"
done
unset sublime_dir
