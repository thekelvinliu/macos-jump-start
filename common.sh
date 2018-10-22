# shellcheck shell=bash disable=SC2034
# bootstrap a common and minimal environment for scripts

# common variables
DONE_MSG="$GREEN$BOLD d o n e$RESET"
MJS_COMMON_ENV=1

# check whether first argument is a command
exists() {
  command -v "$1" &> /dev/null
}

# check whether homebrew is installed
has_brew() {
  exists brew
}

# check whether a cask is installed
brew_cask_installed() {
  grep -Fqsx "$1" <(brew cask list -1)
}

# install a cask
brew_cask_install() {
  if brew_cask_installed "$1"; then
    echo -e "$BLUE$1$RESET is already installed."
  else
    brew cask install "$1"
  fi
}

# check whether a formula is installed
brew_installed() {
  grep -Fqsx "$1" <(brew list -1)
}

# install a homebrew formula
brew_install() {
  local formula=$1
  if brew_installed "$formula"; then
    echo -e "$BLUE$formula$RESET is already installed."
  else
    brew install "$@"
  fi
}

# check whether a tap is tapped
brew_tapped() {
  grep -Fqsx "$1" <(brew tap)
}

# tap a homebrew tap
brew_tap() {
  if brew_tapped "$1"; then
    echo -e "$BLUE$1$RESET is already tapped."
  else
    brew tap "$1"
  fi
}
