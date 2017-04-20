#!/usr/bin/env bash
# 01_prompt.sh - script to get github username and email

while true; do
  read -p "Enter your github username: " un
  read -p "Your github username is $GREEN$un$RESET. Is this correct-- yes or no? " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) :;;
    * ) echo "Please answer yes or no.";;
  esac
done
while true; do
  read -p "Enter your email: " email
  read -p "Your email is $GREEN$email$RESET. Is this correct-- yes or no? " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) :;;
    * ) echo "Please answer yes or no.";;
  esac
done
