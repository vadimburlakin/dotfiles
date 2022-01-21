#!/bin/bash

CONFIGFILENAME=".zshrc.nvm"
CONFIGFILE="$HOME/$CONFIGFILENAME"
SCRIPT="nvm"
BREWFORMULA="nvm"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  brew remove $BREWFORMULA
  rm -rf $CONFIGFILE
  sed -i '' '/nvm/d' ~/.zshrc
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing $BREWFORMULA from Homebrew..."
brew install $BREWFORMULA
mkdir -p ~/.nvm

if [[ -e $CONFIGFILE ]]; then
  warning "$CONFIGFILE already exists, renaming it to $CONFIGFILE.backup"
  mv $CONFIGFILE $CONFIGFILE.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGFILENAME $CONFIGFILE
echo "source ~/.zshrc.nvm" >> ~/.zshrc
