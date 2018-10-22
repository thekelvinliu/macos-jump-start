#!/usr/bin/env bash
# install and setup (neo)vim

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# vim and nvim
brew_install vim
brew_install neovim

# write nvim config that also uses .vimrc
nvim_path=$HOME/.config/nvim
mkdir -p "$nvim_path"
cat <<EOF > "$nvim_path/init.vim"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
