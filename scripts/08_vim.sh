# install (n)vim

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# vim and nvim
brew_install vim
brew_install nvim

# write nvim config
nvim_path=$HOME/.config/nvim
mkdir -p "$nvim_path"
cat <<EOF > "$nvim_path/init.vim"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

# clean things up
brew cleanup
