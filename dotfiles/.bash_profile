# source other dotfiles

for dot in .{exports,path,prompt,aliases,functions,extra}; do
  [ -r "$HOME/$dot" ] && . "$HOME/$dot"
done
unset dot
