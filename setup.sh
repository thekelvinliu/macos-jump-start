#!/usr/bin/env bash
# setup scripts and dotfiles for a happy development environment

# allow custom location, but default to home directory
export MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}

# ensure xcode is installed
if [[ -n $(xcode-select -p 2> /dev/null) ]]; then
  # get a common execution environment
  . "$MJS_BASE/common.sh"
  # execute scripts
  for script in "$MJS_BASE/scripts/"*; do
    echo -e "running $YELLOW$script$RESET..."
    # TODO test each script individually
    "$script"
    sleep 1
  done
else
  echo "install xcode and agree to the liscence before running this script."
fi

echo -e "$DONE_MSG"
echo "system ready -- enjoy development!"
echo -e "$DONE_MSG"
