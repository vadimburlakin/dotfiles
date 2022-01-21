#!/bin/bash

CONFIGDIRNAME=".tmux"
CONFIGFILENAME=".tmux.conf"
CONFIGDIR="$HOME/$CONFIGDIRNAME"
CONFIGFILE="$HOME/$CONFIGFILENAME"
SCRIPT="tmux"
BREWFORMULA="tmux"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  brew remove $BREWFORMULA
  rm -rf $CONFIGDIR
  rm -rf $CONFIGFILE
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing $BREWFORMULA from Homebrew..."
brew install $BREWFORMULA

if [[ -e $CONFIGDIR ]]; then
  warning "$CONFIGDIR already exists, renaming it to $CONFIGDIR.backup"
  mv $CONFIGDIR $CONFIGDIR.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGDIRNAME $CONFIGDIR

if [[ -e $CONFIGFILE ]]; then
  warning "$CONFIGFILE already exists, renaming it to $CONFIGFILE.backup"
  mv $CONFIGFILE $CONFIGFILE.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGFILENAME $CONFIGFILE

echo "Installing tpm..."
git clone https://github.com/tmux-plugins/tpm $CONFIGDIR/plugins/tpm