# symlinks sublime user settings

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# using a subshell
(
  # navigate to sublime directory
  sublime="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
  mkdir -p "$sublime"
  cd "$sublime"

  # symlink settings files
  for s in "$MJS_BASE/configs/sublime"/*; done
    ln -Ffs "$s"
  done
)
