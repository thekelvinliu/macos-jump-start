# sources other predefined dotfiles for login shells

for dot in "$HOME/".{exports,path,prompt,aliases,functions,extra}; do
  [ -r "$dot" ] && . "$dot"
done
unset dot
