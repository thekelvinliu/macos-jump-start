# symlinks dotfiles to $HOME

# enable functions
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/dotfiles/.functions"

# check for GIT_EMAIL and GIT_USERNAME
if [[ -z "$GIT_EMAIL" || -z "$GIT_USERNAME" ]]; then
  echo "missing git email and/or username"
  . "$OJS/scripts/01_credentials.sh"
fi

# loop over dotfiles directory
for dot in "$OJS/dotfiles/".[^.]*; do
  # ensure readable
  [[ ! -r "$dot" ]] && continue
  # insert email and username into .gitconfig
  if [[ "$dot" =~ .gitconfig ]]; then
    cat "$dot" | sed "s#_USERNAME#$GIT_USERNAME#g;s#_EMAIL#$GIT_EMAIL#g;s#_HOME#$HOME#g" > "$HOME/.gitconfig"
  else
    (cd && ln -Ffs "$dot")
  fi
done
unset dot

# source the dotfiles now
. "$HOME/.bash_profile"
