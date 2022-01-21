#!/bin/bash

SCRIPT="iterm2"
BREWFORMULA="iterm2"

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
brew install --cask $BREWFORMULA

echo "done"