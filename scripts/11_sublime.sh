# symlinks sublime user settings and color scheme

# get a common execution environment
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/common.sh"

# navigate to sublime directory
sublime="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$sublime"
cd "$sublime"

# symlink settings files
for s in "$OJS/configs/sublime/"*.sublime-*; do
  ln -Ffs "$s"
done

# reset
unset sublime s
cd - > /dev/null
