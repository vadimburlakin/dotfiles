#!/bin/bash

CONFIGDIRNAME=".replaceme"
CONFIGFILENAME=".replaceme.conf"
CONFIGDIR="$HOME/$CONFIGDIRNAME"
CONFIGFILE="$HOME/$CONFIGFILENAME"
SCRIPT="replaceme"
BREWFORMULA="replaceme"

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
  warning "$CONFIGDIR already exists, renaming it to $CONFIGDIR.dist"
  mv $CONFIGDIR $CONFIGDIR.dist
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGDIRNAME $CONFIGDIR

if [[ -e $CONFIGFILE ]]; then
  warning "$CONFIGFILE already exists, renaming it to $CONFIGFILE.dist"
  mv $CONFIGFILE $CONFIGFILE.dist
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGFILENAME $CONFIGFILE