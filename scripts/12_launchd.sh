# symlinks launchd plists

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# setup
agents="$HOME/Library/LaunchAgents"
mkdir -p "$agents"
daemons="/Library/LaunchDaemons"
base="$MJS_BASE/configs/launchd"

# symlink launch agents
for plist in com.thekelvinliu.{backup-{home,thin},gdfs-defaults,launch-alfred,ssh-adder}.plist; do
  launchctl unload "$agents/$plist" 2> /dev/null
  ln -Ffs "$base/$plist" "$agents"
  echo "symlinked $MAGENTA$plist$RESET to $CYAN$agents$RESET"
  launchctl load "$agents/$plist"
done

# symlink backup-root as launch daemon for root
plist=com.thekelvinliu.backup-root.plist
sudo launchctl unload "$daemons/$plist" 2> /dev/null
sudo ln -Ffs "$base/$plist" "$daemons"
sudo chown root:wheel "$daemons/$plist"
echo "symlinked $MAGENTA$plist$RESET to $CYAN$daemons$RESET"
sudo launchctl load "$daemons/$plist"

# remove variables
unset agents daemons base plist
