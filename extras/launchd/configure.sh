#!/usr/bin/env bash
echo -e "this script configures ${RED}launchd$RESET with the ${YELLOW}.plist$RESET files in this directory"

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

while true; do
  read -rp "do you want to continue? (y/n) " yn
  case "$yn" in
    [Yy]*) break;;
    [Nn]*) exit;;
    *) echo "please answer yes or no."
  esac
done

# ensure directory exists
agents="$HOME/Library/LaunchAgents"
mkdir -p "$agents"
# iterate over plists
for plist in "$MJS_BASE/extras/launchd"/*.plist; do
  fname=$(basename "$plist")
  fout=$agents/$fname
  launchctl unload "$fout" 2> /dev/null
  ln -Ffs "$plist" "$agents"
  echo -e "symlinked $MAGENTA$fname$RESET to $CYAN$fout$RESET"
  launchctl load "$fout"
done
