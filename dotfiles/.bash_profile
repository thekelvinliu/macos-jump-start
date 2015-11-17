# Adapted from https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.bash_profile

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in $HOME/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && . "$file"
done
unset file
