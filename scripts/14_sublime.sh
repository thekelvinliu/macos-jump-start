# symlink sublime user settings

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# setup
sublime="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$sublime"

# symlink settings
for s in "$MJS_BASE/configs/sublime"/*; do
  ln -Ffs "$s" "$sublime"
  echo "symlinked $MAGENTA$(basename "$s")$RESET to $CYAN$sublime$RESET"
done

# remove variables
unset s sublime
