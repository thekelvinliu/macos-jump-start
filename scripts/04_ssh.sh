# install homebrew ssh and create a strong keypair

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"
# ensure SSH_PRIVATE_KEY and SSH_PUBLIC_KEY are set
. "$MJS_BASE/dotfiles/.exports"

# use homebrew openssh
brew_install openssh

# generate a key if necessary
if [[ -e "$SSH_PRIVATE_KEY" && -e "$SSH_PUBLIC_KEY" ]]; then
  echo "a ssh keypair already exists."
else
  # ask for a comment
  while true; do
    read -p "enter a ${YELLOW}comment$RESET for your new keypair:" comment
    echo "your ${YELLOW}comment$RESET is $GREEN$comment$RESET"
    read -p "is that correct? (y/n) " yn
    case "$yn" in
      [Yy]*) break;;
      [Nn]*) :;;
      *) echo "please answer yes or no."
    esac
  done

  # generate an ed25519 key
  ssh-keygen -t ed25519 -a 100 -C "$comment" -f "$SSH_PRIVATE_KEY"
  # copy to clipboard
  pbcopy < "$SSH_PUBLIC_KEY"
  echo "$SSH_PUBLIC_KEY was copied to the clipboard"
fi
unset comment yn

# symlink sshd_config
target=/etc/ssh/sshd_config
echo "requesting password to symlink sshd_config"
[[ ! -L $target ]] && sudo mv "$target" "$target.old"
fname=$MJS_BASE/configs/ssh/sshd_config
sudo chown root:wheel "$fname"
sudo ln -Ffs "$fname" "$target"

# remove variables
unset fname target

# symlink launchd plists
# daemons="/Library/LaunchDaemons"
# sudo mkdir -p "$daemons"
# plist="$MJS_BASE/configs/ssh/sshd.plist"
# sudo chown root:wheel "$plist"
# fname=$(basename "$plist")
# fout=$daemons/$fname
# sudo launchctl unload "$fout" 2> /dev/null
# sudo ln -Ffs "$plist" "$daemons"
# echo "symlinked $MAGENTA$fname$RESET to $CYAN$fout$RESET"
# sudo launchctl load "$fout"
