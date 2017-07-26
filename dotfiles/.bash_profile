# sources other predefined dotfiles for login shells

for dot in "$HOME/".{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$dot" ] && . "$dot"
done
unset dot
