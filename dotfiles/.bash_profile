# loads other dotfiles

for dot in "$HOME/".{path,bash_prompt,exports,aliases,functions,extra}; do
  echo "$dot"
  # [ -r "$dot" ] && . "$dot"
done
unset dot
