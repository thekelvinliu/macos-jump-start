# source other dotfiles

# use dotglob and histappend
shopt -s dotglob histappend

# do nothing for non-interactive shells
[[ $- =~ i ]] || return

for dot in .{exports,path,prompt,aliases,functions,extra}; do
  [[ -r $HOME/$dot ]] && . "$HOME/$dot"
done
unset dot
