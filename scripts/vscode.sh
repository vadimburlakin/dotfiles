#!/bin/bash
SCRIPT="vscode"
BREWFORMULA="visual-studio-code"
CODE_BINARY="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
CONFIGFILENAME="settings.json"
LIBRARYDIR="$HOME/Library/Application Support/Code"
CONFIGDIR="$LIBRARYDIR/User"
CONFIGFILE="$CONFIGDIR/$CONFIGFILENAME"
EXTENSIONSDIR="$HOME/.vscode"

while getopts r flag
do
  case "${flag}" in
    r) REINSTALL="true";;
  esac
done
REINSTALL=${REINSTALL:-false}

undo () {
  brew remove --cask $BREWFORMULA
  rm -rf "$LIBRARYDIR"
  rm -rf "$EXTENSIONSDIR"
}

if [ "$REINSTALL" == "true" ]; then
  warning "Reinstalling"
  undo
fi

echo "Installing $BREWFORMULA from Homebrew..."
brew install --cask $BREWFORMULA

echo "Installing configuration..."
if [[ -e "$CONFIGFILE" ]]; then
  warning "$CONFIGFILE already exists, renaming it to $CONFIGFILE.backup"
  mv "$CONFIGFILE" "$CONFIGFILE.backup"
fi

mkdir -p "$CONFIGDIR"
cp -R "$SCRIPTSDIR/$SCRIPT/$CONFIGFILENAME" "$CONFIGFILE"

echo "Installing extensions..."
"$CODE_BINARY" --install-extension dbaeumer.vscode-eslint
"$CODE_BINARY" --install-extension eamodio.gitlens
"$CODE_BINARY" --install-extension ms-vsliveshare.vsliveshare
"$CODE_BINARY" --install-extension pkief.material-icon-theme
"$CODE_BINARY" --install-extension christian-kohler.path-intellisense
"$CODE_BINARY" --install-extension esbenp.prettier-vscode
"$CODE_BINARY" --install-extension vscodevim.vim

echo "done"
