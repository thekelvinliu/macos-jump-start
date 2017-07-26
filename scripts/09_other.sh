# installs extra and miscellaneous stuff

# get a common execution environment
OJS=${OJS:-"$HOME/osx-jump-start"}
. "$OJS/common.sh"

# ensure homebrew is installed before continuing
if ! has_brew; then
  echo "homebrew is not installed -- exiting."
  return
fi

# update formulae
brew update

# databases
# brew_install mysql
# brew_install mongodb
brew_install sqlite

# media
brew_install ffmpeg
brew_install imagemagick

# other
brew_install ondir
brew_install pass
