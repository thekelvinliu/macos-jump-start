#!/usr/bin/env bash
# 03_ssh.sh - creates ssh keys if none exist

# ensure $SSH_PRIVATE_KEY and $SSH_PUBLIC_KEY are set
. $HOME/osx-jump-start/dotfiles/.exports

# check for $email and run 01_prompt.sh if it is undefined
if [[ -z $email ]]; then
    echo "Missing email!"
    . $HOME/osx-jump-start/scripts/01_prompt.sh
fi

# generate a key if necessary
if [[ ! -e $SSH_PRIVATE_KEY || ! -e $SSH_PUBLIC_KEY ]]; then
    # generate an Ed25519 key
    ssh-keygen -t ed25519 -a 100 -C $email -f $SSH_PRIVATE_KEY
    # let osx keychain handle the key
    echo "adding ssh key to keychain -- you may need to enter your password"
    ssh-add -K $SSH_PRIVATE_KEY
    # copy public key to clipboard and open github
    pbcopy < $SSH_PUBLIC_KEY
    open https://github.com/settings/ssh
else
    echo "an Ed25519 keypair already exists."
fi

# symlink plist fix to ~/Library/LaunchAgents/
mkdir -p "$HOME/Library/LaunchAgents"
ln -s "$HOME/osx-jump-start/configs/plists/ssh.add.plist" "$HOME/Library/LaunchAgents"
