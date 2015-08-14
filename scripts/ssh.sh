#!/usr/bin/env bash
# ssh.sh - creates ssh keys if none exist

if [[ ! -e $SSH_KEY ]]; then
    ssh-keygen -t rsa -b 4096 -C $email -N "" -f $SSH_KEY -q
    eval "$(ssh-agent -s)"
    ssh-add $SSH_KEY
    # pbcopy < $SSH_KEY
    # open https://github.com/settings/ssh
else
    echo $SSH_KEY already exists.
fi
