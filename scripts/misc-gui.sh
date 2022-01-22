#!/bin/bash

SCRIPT="misc-gui"
BREWFORMULA=(iterm2 zoomus vlc vmware-fusion postman notion kindle \
         google-chrome chromium drawio-desktop docker deepl slack \
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