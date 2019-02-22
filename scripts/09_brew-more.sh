#!/usr/bin/env bash
# install extra and miscellaneous stuff

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# media
brew_install ffmpeg
brew_install graphicsmagick

# other
# brew_install awscli
brew_install colordiff
brew_install borgbackup
brew_install gnupg
brew_install gocryptfs
brew_install kubernetes-cli
brew_install pass
brew_install rsync
brew_install shellcheck
brew_install task
brew_install yamllint
