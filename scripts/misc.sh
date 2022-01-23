#!/bin/bash

SCRIPT="misc"
BREWFORMULA=(git fzf the_silver_searcher zsh)

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  for formula in "${BREWFORMULA[@]}"; do
    brew remove $formula
  done;
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing ${BREWFORMULA[@]} from Homebrew..."
for formula in "${BREWFORMULA[@]}"; do
  brew install $formula
done;

echo "done"