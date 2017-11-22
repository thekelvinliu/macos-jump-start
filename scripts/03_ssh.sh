# creates a strong default ssh keypair

# ensure SSH_PRIVATE_KEY and SSH_PUBLIC_KEY are set
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/dotfiles/.exports"

# generate a key if necessary
if [[ -e "$SSH_PRIVATE_KEY" && -e "$SSH_PUBLIC_KEY" ]]; then
  echo "an ed25519 keypair already exists."
else
  # check for GIT_EMAIL
  if [[ -z "$GIT_EMAIL" ]]; then
    echo "missing git email"
    . "$MJS_BASE/scripts/01_credentials.sh"
  fi
  # generate an ed25519 key
  ssh-keygen -t ed25519 -a 100 -C "$GIT_EMAIL" -f "$SSH_PRIVATE_KEY"
  # copy to clipboard
  pbcopy < "$SSH_PUBLIC_KEY"
  echo "$SSH_PUBLIC_KEY was copied to the clipboard"
fi
