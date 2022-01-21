#!/bin/bash

CONFIGDIRNAME=".vim"
CONFIGDIR="$HOME/$CONFIGDIRNAME"

CONFIGFILENAME=".vimrc"
CONFIGFILE="$HOME/$CONFIGFILENAME"

INITVIMDIR="$HOME/.config/nvim"
INITVIMFILENAME="init.vim"
INITVIMPATH="$INITVIMDIR/$INITVIMFILENAME"

SCRIPT="vim"
BREWFORMULA="neovim"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  brew remove $BREWFORMULA
  rm -rf $CONFIGDIR
  rm -rf $CONFIGFILE
  rm -rf $INITVIMPATH
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing $BREWFORMULA from Homebrew..."
brew install $BREWFORMULA

if [[ -e $CONFIGDIR ]]; then
  warning "$CONFIGDIR already exists, renaming it to $CONFIGDIR.backup"
  mv $CONFIGDIR $CONFIGDIR.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGDIRNAME $CONFIGDIR

if [[ -e $CONFIGFILE ]]; then
  warning "$CONFIGFILE already exists, renaming it to $CONFIGFILE.backup"
  mv $CONFIGFILE $CONFIGFILE.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$CONFIGFILENAME $CONFIGFILE

mkdir -p $INITVIMDIR

if [[ -e $INITVIMPATH ]]; then
  warning "$INITVIMPATH already exists, renaming it to $INITVIMPATH.backup"
  mv $INITVIMPATH $INITVIMPATH.backup
fi

cp -R $SCRIPTSDIR/$SCRIPT/$INITVIMFILENAME $INITVIMPATH

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing plugins..."
vim +PluginInstall +qall

