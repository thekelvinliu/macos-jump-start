# install tmux and related things

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# tmux
brew_install tmux

# tpm
tpm_dir=$HOME/.tmux/plugins
mkdir -p "$tpm_dir"
if [[ ! -e "$tpm_dir/tpm" ]]; then
  git clone https://github.com/tmux-plugins/tpm "$tpm_dir"
else
  echo "${BLUE}tpm$RESET is already installed."
fi
