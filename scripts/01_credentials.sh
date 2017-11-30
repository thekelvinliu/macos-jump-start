# sets git email and username environment variables

# ask for creds if they don't already exist
if [[ -z "$GIT_EMAIL" || -z "$GIT_USERNAME" ]]; then
  while true; do
    read -p "enter your git ${YELLOW}email$RESET: " GIT_EMAIL
    echo "your git ${YELLOW}email$RESET is $GREEN$GIT_EMAIL$RESET"
    read -p "is that correct? (y/n) " yn
    case "$yn" in
      [Yy]*) break;;
      [Nn]*) :;;
      *) echo "please answer yes or no."
    esac
  done

  while true; do
    read -p "enter your git ${YELLOW}username$RESET: " GIT_USERNAME
    echo "your git ${YELLOW}username$RESET is $GREEN$GIT_USERNAME$RESET"
    read -p "is that correct? (y/n) " yn
    case "$yn" in
      [Yy]*) break;;
      [Nn]*) :;;
      *) echo "please answer yes or no."
    esac
  done
fi

export GIT_{EMAIL,USERNAME}
