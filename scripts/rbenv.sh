#!/bin/bash

SCRIPT="rbenv"
BREWFORMULA="rbenv"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  brew remove $BREWFORMULA
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing $BREWFORMULA from Homebrew..."
brew install $BREWFORMULA

# so that ruby shims immediately become available for next scripts:
eval "$(rbenv init - zsh)"

echo "done"