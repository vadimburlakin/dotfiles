#!/bin/bash
NODEVERSION="16"
SCRIPT="node16"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

source ~/.zshrc.nvm

undo () {
  nvm uninstall 16
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing Node $NODEVERSION via nvm..."

nvm install $NODEVERSION
nvm alias default $NODEVERSION