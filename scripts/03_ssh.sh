#!/usr/bin/env bash
# 03_ssh.sh - creates ssh keys if none exist

if [[ ! -e ${SSH_KEY:=$HOME/.ssh/id_rsa} ]]; then
    ssh-keygen -t rsa -b 4096 -C $email -N "" -f $SSH_KEY -q
    eval "$(ssh-agent -s)"
    ssh-add $SSH_KEY
    # pbcopy < $SSH_KEY
    # open https://github.com/settings/ssh
else
    echo $SSH_KEY already exists.
fi
