# symlinks launchd plists

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# setup
agents="$HOME/Library/LaunchAgents"
mkdir -p "$agents"
base="$MJS_BASE/configs/launchd"

# symlink launch agents
for plist in com.thekelvinliu.{gdfs-defaults,launch-alfred,ssh-adder}.plist; do
  launchctl unload "$agents/$plist" 2> /dev/null
  ln -Ffs "$base/$plist" "$agents"
  echo "symlinked $MAGENTA$plist$RESET to $CYAN$agents$RESET"
  launchctl load "$agents/$plist"
done

# TODO write symlink launch daemons
# for plist in com.thekelvinliu.{}.plist; do
# done

# remove variables
unset agents base plist
