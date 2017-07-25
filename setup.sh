#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment

# variables
DONE="$GREEN$BOLDd o n e$RESET"
OJS="$HOME/osx-jump-start"

# ensure xcode is installed
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
  # enable install functions and prompt colors
  . "$OJS/common.sh"
  . "$OJS/dotfiles/.bash_prompt"
  # run scripts
  for script in "$OJS/scripts/"[0-9]*; do
    echo "running $YELLOW$script$RESET..."
    # . "$script"
    sleep 1
  done
else
  echo "install xcode and agree to the liscence before running this script."
fi

echo "$DONE"
echo "system ready -- enjoy development!"
echo "$DONE"

unset DONE OJS
