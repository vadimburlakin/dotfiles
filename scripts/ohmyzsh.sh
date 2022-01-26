#!/bin/bash

ZSH=${ZSH:-~/.oh-my-zsh}
REPO=${REPO:-ohmyzsh/ohmyzsh}
REMOTE=${REMOTE:-https://github.com/${REPO}.git}
BRANCH=${BRANCH:-master}
SCRIPT="ohmyzsh"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  rm -rf $ZSH
  rm ~/.zshrc
  rm ~/.zshrc.dist
  rm ~/.zshrc.my
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing Oh My Zsh from Github..."
git clone -c core.eol=lf -c core.autocrlf=false \
  -c fsck.zeroPaddedFilemode=ignore \
  -c fetch.fsck.zeroPaddedFilemode=ignore \
  -c receive.fsck.zeroPaddedFilemode=ignore \
  -c oh-my-zsh.remote=origin \
  -c oh-my-zsh.branch="$BRANCH" \
  --depth=1 --branch "$BRANCH" "$REMOTE" "$ZSH"
RESULT="$?"

if [ "$RESULT" != "0" ]; then
  warning "Oh My Zsh installation failed, bailing out"
  exit 1
fi

echo ""

echo "Installing .zshrc..."

ZSHRC="$HOME/.zshrc"
if [[ -e $ZSHRC ]]; then
  warning "$ZSHRC already exists, renaming it to $ZSHRC.backup"
  mv $ZSHRC $ZSHRC.backup
fi

echo "source ~/.zshrc.homebrew" > $ZSHRC
echo "source ~/.zshrc.my" >> $ZSHRC
cp $SCRIPTSDIR/$SCRIPT/.zshrc.my $ZSHRC.my
cp $SCRIPTSDIR/$SCRIPT/.zshrc.dist $ZSHRC.dist

echo "Installing fzf-tab..."
git clone https://github.com/Aloxaf/fzf-tab $ZSH/custom/plugins/fzf-tab

echo "done"
