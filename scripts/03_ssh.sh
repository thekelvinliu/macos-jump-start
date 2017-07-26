# creates a strong default ssh keypair

# ensure SSH_PRIVATE_KEY and SSH_PUBLIC_KEY are set
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/dotfiles/.exports"

# generate a key if necessary
if [[ -e "$SSH_PRIVATE_KEY" && -e "$SSH_PUBLIC_KEY" ]]; then
  echo "an ed25519 keypair already exists."
else
  # check for GIT_EMAIL
  if [[ -z "$GIT_EMAIL" ]]; then
    echo "missing git email"
    . "$OJS/scripts/01_credentials.sh"
  fi
  # generate an ed25519 key
  ssh-keygen -t ed25519 -a 100 -C "$GIT_EMAIL" -f "$SSH_PRIVATE_KEY"
  # let osx keychain handle the key
  echo "adding ssh key to keychain -- you may need to enter your password"
  ssh-add -K "$SSH_PRIVATE_KEY"
  # copy public key to clipboard and open github
  pbcopy < "$SSH_PUBLIC_KEY"
  open https://github.com/settings/ssh
fi
