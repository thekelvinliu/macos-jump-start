#!/usr/bin/env bash
echo -e "this script configures ${RED}sshd$RESET to be ${YELLOW}hardened and usable$RESET (password required)"

# ensure colors work
[[ ! $BOLD ]] && . "$MJS_BASE/dotfiles/.colors"

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# set up sshd.plist
daemons=/Library/LaunchDaemons
fname=sshd.plist
fout=$daemons/$fname
plist=$MJS_BASE/extras/sshd/$fname
# file ownership
sudo mkdir -p "$daemons"
sudo chown root:wheel "$plist"
# symlink and launchd
sudo launchctl unload "$fout" 2> /dev/null
sudo ln -Ffs "$plist" "$daemons"
echo -e "symlinked $MAGENTA$fname$RESET to $CYAN$fout$RESET"
sudo launchctl load "$fout"

# symlink sshd_config
fname=sshd_config
fout=/usr/local/etc/ssh/$fname
[[ ! -L $fout ]] && mv "$fout" "$fout.old"
ln -Ffs "$MJS_BASE/extras/sshd/$fname" "$fout"
echo -e "symlinked $MAGENTA$fname$RESET to $CYAN$fout$RESET"

# add firewall rule for homebrew's sshd
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --add /usr/local/sbin/sshd

echo -e "$DONE_MSG"
