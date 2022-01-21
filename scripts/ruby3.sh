#!/bin/bash
RUBYVERSION="3.0.0"
SCRIPT="ruby3"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  rbenv uninstall $VERSION
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing Ruby $RUBYVERSION via rbenv..."

rbenv install $RUBYVERSION
rbenv global $RUBYVERSION