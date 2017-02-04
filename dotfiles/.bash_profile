# adapted from https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_profile

# load all other dotfiles
for file in $HOME/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && . "$file"
done
unset file

# enable bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# enable nvm
. $(brew --prefix nvm)/nvm.sh

# enable ondir
cd() {
  builtin cd "$@" && eval "`ondir \"$OLDPWD\" \"$PWD\"`"
}
pushd() {
  builtin pushd "$@" && eval "`ondir \"$OLDPWD\" \"$PWD\"`"
}
popd() {
  builtin popd "$@" && eval "`ondir \"$OLDPWD\" \"$PWD\"`"
}
