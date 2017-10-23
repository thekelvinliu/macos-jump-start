# symlinks sublime user settings and color scheme

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# navigate to sublime directory
sublime="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$sublime"
cd "$sublime"

# symlink settings files
for s in "$MJS_BASE/configs/sublime/"*.sublime-*; do
  ln -Ffs "$s"
done

# reset
unset sublime s
cd - > /dev/null
