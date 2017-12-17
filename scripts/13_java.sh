# installs jenv, java, and gradle

# get a common execution environment
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# jenv
brew_install jenv

# java 9
vlist=$(jenv versions)
brew_cask_install java
jenv add "$(/usr/libexec/java_home -v 9.0)"

# java 8
brew_cask_install java8
jenv add "$(/usr/libexec/java_home -v 1.8)"
jenv global 9.0
unset vlist

# gradle
brew_install gradle
