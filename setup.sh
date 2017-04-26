#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment

# ensure xcode is installed
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
  # enable colors
  . $HOME/osx-jump-start/dotfiles/.bash_prompt

  # run the scripts
  for file in $HOME/osx-jump-start/scripts/[0-9]*; do
    echo "Running $YELLOW$file$RESET..."
    . $file && sleep 1
  done
else
  echo "Install Xcode and agree to the liscence before running this script!"
fi

echo "$GREEN$BOLD D O N E $RESET"
echo "-- Enjoy developing on your new system! --"
echo "$GREEN$BOLD D O N E $RESET"
