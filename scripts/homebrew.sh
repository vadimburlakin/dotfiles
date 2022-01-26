#!/bin/bash
CONFIGFILENAME=".zshrc.homebrew"
CONFIGFILE="$HOME/$CONFIGFILENAME"
SCRIPT="homebrew"
BREWFORMULA="homebrew"

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
  sed -i '' '/homebrew/d' ~/.zshrc
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ -e $CONFIGFILE ]]; then
  warning "$CONFIGFILE already exists, renaming it to $CONFIGFILE.backup"
  mv $CONFIGFILE $CONFIGFILE.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGFILENAME $CONFIGFILE

eval "$(/opt/homebrew/bin/brew shellenv)"
