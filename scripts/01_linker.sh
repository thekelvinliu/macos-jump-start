#!/usr/bin/env bash
# symlink dotfiles to $HOME directory

# ensure colors work
[[ ! $BOLD ]] && . "$MJS_BASE/dotfiles/.colors"

# ask for git creds if they don't already exist
if [[ ! $GIT_EMAIL || ! $GIT_USERNAME ]]; then
  while true; do
    echo -e "enter your git ${YELLOW}email$RESET: "
    read -r GIT_EMAIL
    echo -e "your git ${YELLOW}email$RESET is $GREEN$GIT_EMAIL$RESET"
    read -rp "is that correct? (y/n) " yn
    case "$yn" in
      [Yy]*) break;;
      [Nn]*) :;;
      *) echo "please answer yes or no."
    esac
  done

  while true; do
    echo -e "enter your git ${YELLOW}username$RESET: "
    read -r GIT_USERNAME
    echo -e "your git ${YELLOW}username$RESET is $GREEN$GIT_USERNAME$RESET"
    read -rp "is that correct? (y/n) " yn
    case "$yn" in
      [Yy]*) break;;
      [Nn]*) :;;
      *) echo "please answer yes or no."
    esac
  done
fi

# loop over dotfiles directory
shopt -s dotglob
for dot in "$MJS_BASE/dotfiles/"*; do
  # ensure readable
  [[ ! -r $dot ]] && continue
  # insert email and username into .gitconfig
  if [[ $dot =~ .gitconfig ]]; then
    sed "s|_USERNAME|$GIT_USERNAME|g;s|_EMAIL|$GIT_EMAIL|g;s|_HOME|$HOME|g;" "$dot" > "$HOME/.gitconfig"
  else
    ln -Ffs "$dot" "$HOME"
  fi
done
