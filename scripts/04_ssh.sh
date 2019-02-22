#!/usr/bin/env bash
# install homebrew ssh and create a strong keypair

# ensure colors work
[[ ! $BOLD ]] && . "$MJS_BASE/dotfiles/.colors"

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  exit 1
fi

# use homebrew openssh
# brew_install openssh

# only generate an ed25519 keypair if necessary
ssh_private_key="$HOME/.ssh/id_ed25519"
ssh_public_key="$HOME/.ssh/id_ed25519.pub"
if [[ -e $ssh_private_key && -e $ssh_public_key ]]; then
  echo "ssh keypair already exists."
  exit 0
fi

# ask for a comment
while true; do
  echo -e "enter a ${YELLOW}comment$RESET for your new keypair: "
  read -r comment
  echo -e "your ${YELLOW}comment$RESET is $GREEN$comment$RESET"
  read -rp "is that correct? (y/n) " yn
  case "$yn" in
    [Yy]*) break;;
    [Nn]*) :;;
    *) echo "please answer yes or no."
  esac
done

# generate keypair
ssh-keygen -t ed25519 -a 100 -C "$comment" -f "$ssh_private_key"
