#!/bin/bash
KEYNAME="my-github"
SCRIPT="ssh"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  rm ~/.ssh/$KEYNAME
  rm ~/.ssh/$KEYNAME.pub
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

ssh-keygen -f ~/.ssh/$KEYNAME -N ''

CONFIGPATH="$HOME/.ssh/config"

if [[ -e $CONFIGPATH ]]; then
  warning "$CONFIGPATH already exists, renaming it to $CONFIGPATH.backup"
  mv $CONFIGPATH $CONFIGPATH.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/config $CONFIGPATH
chmod 644 $CONFIGPATH