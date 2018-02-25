# install homebrew ssh and create a strong keypair

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"
# ensure SSH_PRIVATE_KEY and SSH_PUBLIC_KEY are set
. "$MJS_BASE/dotfiles/.exports"

# openssh
brew_install openssh

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

# symlink sshd_config
fname=/usr/local/etc/ssh/sshd_config
echo "requesting password to symlink sshd_config"
[[ ! -L $fname ]] && sudo mv "$fname" "$fname.old"
ln -Ffs "$MJS_BASE/configs/ssh/sshd_config" "$fname"

# symlink launchd plists
daemons="/Library/LaunchDaemons"
sudo mkdir -p "$daemons"
plist="$MJS_BASE/configs/ssh/sshd.plist"
sudo chown root:wheel "$plist"
fname=$(basename "$plist")
fout=$daemons/$fname
sudo launchctl unload "$fout" 2> /dev/null
sudo ln -Ffs "$plist" "$daemons"
echo "symlinked $MAGENTA$fname$RESET to $CYAN$fout$RESET"
sudo launchctl load "$fout"

# remove variables
unset daemons fname fout
