#!/bin/bash

## WARNING ##
# If you change ruby version, also update:
#  scripts/vim/.vim/startup/settings.vim
# because Neovim needs to know Ruby install location.
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