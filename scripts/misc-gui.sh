#!/bin/bash

SCRIPT="misc-gui"
BREWFORMULA=(vmware-fusion iterm2 zoom vlc postman notion kindle \
         google-chrome chromium drawio docker deepl slack \
         adobe-creative-cloud transmission)

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  for formula in "${BREWFORMULA[@]}"; do
    brew remove --cask $formula
  done;
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing ${BREWFORMULA[@]} from Homebrew..."
for formula in "${BREWFORMULA[@]}"; do
  brew install --cask $formula
done;

echo "done"
