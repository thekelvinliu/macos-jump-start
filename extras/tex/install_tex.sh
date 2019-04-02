#!/usr/bin/env bash
# install basictex, tools, and some ctan packages

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"


# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# small tex distribution
brew_cask_install basictex

# viewer
brew_cask_install skim

# update infrastructure and installed packages
sudo /Library/TeX/texbin/tlmgr update --self --all

# install packages
sudo /Library/TeX/texbin/tlmgr install chktex
sudo /Library/TeX/texbin/tlmgr install latexmk
sudo /Library/TeX/texbin/tlmgr install lipsum
