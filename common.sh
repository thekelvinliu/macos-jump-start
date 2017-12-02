# bootstraps a common and minimal environment for scripts

# variables
MJS_BASE=${MJS_BASE:-"$HOME/macos-jump-start"}
. "$MJS_BASE/dotfiles/.colors"
DONE_MSG="$GREEN$BOLD d o n e$RESET"

# functions
# checks whether first arg is a command
exists() {
  command -v "$1" &> /dev/null
}
# checks whether homebrew is installed
has_brew() {
  exists brew
}

# checks whether a given cask is already installed
brew_cask_installed() {
  fgrep -qsx "$1" <(brew cask list -1)
}

# installs a cask
brew_cask_install() {
  if brew_cask_installed "$1"; then
    echo "$BLUE$1$RESET is already installed."
  else
    brew cask install "$1"
  fi
}

# checks whether a given formula is already installed
brew_installed() {
  fgrep -qsx "$1" <(brew list -1)
}

# installs a homebrew formula
brew_install() {
  # get only the name of the formula
  formula=$(echo "$1" | cut -d' ' -f1)
  if brew_installed "$formula"; then
    echo "$BLUE$formula$RESET is already installed."
  else
    echo "$1" | xargs brew install
  fi
}

# checks whether a given tap is already tapped
brew_tapped() {
  fgrep -qsx "$1" <(brew tap)
}

# taps a homebrew tap
brew_tap() {
  if brew_tapped "$1"; then
    echo "$BLUE$1$RESET is already tapped."
  else
    brew tap "$1"
  fi
}
