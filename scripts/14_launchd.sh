# symlink launchd plists

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

while true; do
  read -p "do you want to symlink the plists in $base? (y/n) " yn
  case "$yn" in
    [Yy]*)
      should_link=true
      break
    ;;
    [Nn]*)
      should_link=false
      break
    ;;
    *) echo "please answer yes or no."
  esac
done

if "$should_link"; then
  # ensure directory exists
  agents="$HOME/Library/LaunchAgents"
  mkdir -p "$agents"
  # iterate over plists
  for plist in "$MJS_BASE"/configs/launchd/*.plist; do
    fname=$(basename "$plist")
    fout=$agents/$fname
    launchctl unload "$fout" 2> /dev/null
    ln -Ffs "$plist" "$agents"
    echo "symlinked $MAGENTA$fname$RESET to $CYAN$fout$RESET"
    launchctl load "$agents/$fname"
  done
fi

# remove variables
unset agents fname fout should_link yn
