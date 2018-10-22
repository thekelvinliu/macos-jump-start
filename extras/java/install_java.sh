#!/usr/bin/env bash
# install openjdk java and gradle

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# latest openjdk
brew_cask_install adoptopenjdk

# gradle
brew_install gradle
