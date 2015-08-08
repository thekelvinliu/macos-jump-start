#!/usr/bin/env bash
# ssh.sh - creates ssh keys if none exist

ssh_path=~/.ssh/id_rsa
if [ ! -e $ssh_path ]; then
    ssh-keygen -t rsa -b 4096 -C "kelvin@thekelvinliu.com" -N "" -f $ssh_path -q
    eval "$(ssh-agent -s)"
    ssh-add $ssh_path
    # pbcopy < $ssh_path
    # open https://github.com/settings/ssh
fi
unset $ssh_path
