#!/usr/bin/env bash
# 03_ssh.sh - creates ssh keys if none exist

if [[ ! -e ${SSH_PUBLIC_KEY:=$HOME/.ssh/id_ed25519.pub} ]]; then
    # generate an Ed25519 key
    ssh-keygen -t ed25519 -a 100 -C $email -f $SSH_PRIVATE_KEY
    # let osx keychain handle the key
    ssh-add -K $SSH_PRIVATE_KEY
    # copy public key to clipboard and open github
    pbcopy < $SSH_PUBLIC_KEY
    open https://github.com/settings/ssh
else
    echo "$SSH_KEY already exists."
fi
