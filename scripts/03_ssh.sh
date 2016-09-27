#!/usr/bin/env bash
# 03_ssh.sh - creates ssh keys if none exist

if [[ ! -e ${SSH_PUBLIC_KEY:=$HOME/.ssh/id_ed25519.pub} ]]; then
    ssh-keygen -t ed25519 -a 100 -C $email -f $SSH_PRIVATE_KEY
    # eval "$(ssh-agent -s)"
    # ssh-add $SSH_KEY
    # pbcopy < $SSH_KEY
    # open https://github.com/settings/ssh
else
    echo "$SSH_KEY already exists."
fi
