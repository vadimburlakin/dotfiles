#!/bin/bash

## WARNING ##
# 1. Ruby must come before Vim to correctly setup Vin's Ruby provider.
# 2. Ruby3 is the default Ruby that is also used by Neovim. Changing Ruby version
#    requires changing Vim settings as well.
LIST=(homebrew osconfig misc misc-gui ohmyzsh tmux fonts rbenv ruby3 \
      vim nvm node16 ssh vscode)

echo "${LIST[@]}"
