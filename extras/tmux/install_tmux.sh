#!/usr/bin/env bash
# install tmux and related things

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# tmux
brew_install tmux

# tpm
tpm_dir=$HOME/.tmux/plugins/tpm
mkdir -p "$(realpath "$tpm_dir/..")"
if [[ ! -e "$tpm_dir" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
  "$tpm_dir/bin/install_plugins"
else
  echo -e "${BLUE}tpm$RESET is already installed."
fi

# symlink configs to $HOME
for f in "$MJS_BASE/extras/tmux/"*.conf; do
  fname="$(basename "$f")"
  fullpath="$HOME/.$fname"
  ln -Ffs "$f" "$fullpath"
  echo -e "symlinked $MAGENTA$fname$RESET to $CYAN$fullpath$RESET"
done
