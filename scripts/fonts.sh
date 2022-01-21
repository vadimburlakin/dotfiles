#!/bin/bash

SCRIPT="fonts"
BREWFORMULA="font-hack-nerd-font"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  brew remove --cask $BREWFORMULA
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing $BREWFORMULA from Homebrew..."
brew tap homebrew/cask-fonts
brew install --cask $BREWFORMULA

echo "done"