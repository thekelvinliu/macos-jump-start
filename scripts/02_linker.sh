# symlinks dotfiles to $HOME

# get a common execution environment
. "$OJS/common.sh"
# enable functions
. "$OJS"

#
# enable functions
. $HOME/osx-jump-start/dotfiles/.functions

# check for $un and $email, if either is undefined, run 01_prompt.sh
if [[ -z "$un" || -z "$email" ]]; then
  echo "Missing username and/or email!"
  . $HOME/osx-jump-start/scripts/01_prompt.sh
fi

# loop through bash-related dotfiles
for file in "$HOME"/osx-jump-start/dotfiles/.[^.]*; do
  if [ -r "$file" ]; then
    file=$(realpath $file)
    # insert username and email into gitconfig
    if [[ $file =~ .gitconfig ]]; then
      cat $file | sed "s#_un#$un#g;s#_email#$email#g;s#_HOME#$HOME#g" > $HOME/.gitconfig
    # otherwise, just symlink
    else
      (cd && ln -Ffs $file)
    fi
  fi
done
unset file
