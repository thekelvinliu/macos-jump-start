#!/usr/bin/env bash
# symlink configs

# get a common execution environment
[[ ! $MJS_COMMON_ENV ]] && . "${MJS_BASE:-"$HOME/macos-jump-start"}/common.sh"

# symlink files in one directory to another
link_contents() {
  local src=$1
  local tgt=$2

  # ensure target directory exists
  mkdir -p "$tgt"

  # symlink files
  for f in "$src"/*; do
    # shellcheck disable=SC2155
    local fname="$(basename "$f")"
    local fullpath="$tgt/$fname"

    # append .default if not already symlinked
    [[ ! -h $fullpath ]] && echo mv "$fullpath" "$fullpath.default"

    ln -Ffs "$f" "$tgt"
    echo -e "symlinked $MAGENTA$fname$RESET to $CYAN$fullpath$RESET"
  done
}

# kitty
link_contents "$MJS_BASE/configs/kitty" "$HOME/.config/kitty"

# spectacle
link_contents "$MJS_BASE/configs/spectacle" "$HOME/Library/Application Support/Spectacle"

# sublime
link_contents "$MJS_BASE/configs/sublime" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
