#!/usr/bin/env bash
# setup.sh - sets up scripts and dotfiles for a happy development environment

# some variables
DONE="$GREEN$BOLD d o n e $RESET"
OJS="$HOME/osx-jump-start"

# ensure xcode is installed
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
  # enable colors
  . "$OJS/dotfiles/.bash_prompt"

  # run the scripts
  for file in "$OJS/scripts/"[0-9]*; do
    echo "running $YELLOW$file$RESET..."
    # . $file && sleep 1
  done
else
  echo "install xcode and agree to the liscence before running this script."
fi

echo "$DONE"
echo "system ready -- enjoy development!"
echo "$DONE"

unset DONE OJS
