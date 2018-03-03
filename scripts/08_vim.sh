# install vim and plugs

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

# vim
brew_install nvim
brew_install vim

# neovim
brew_install neovim
pip2_install neovim
pip3_install neovim
# write config
nvim_path=$HOME/.config/nvim
mkdir -p "$nvim_path"
cat <<EOF > "$nvim_path/init.vim"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

# clean things up
brew cleanup
