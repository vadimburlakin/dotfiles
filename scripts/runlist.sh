#!/bin/bash

## WARNING ##
# 1. Ruby must come before Vim.
# 2. As of now, Ruby3 is the default Ruby that is also used by Neovim.
LIST=(homebrew git fzf zsh ohmyzsh tmux fonts rbenv ruby3 vim nvm node16 \
      iterm2 vscode)

# LIST=( \
#           \
#         vs-vim vs-liveshare vs-gitlens vs-prettier \
#         vs-intellisense vs-icons macos-config \
#         zoomus vlc virtualbox postman notion kindle \
#         google-chrome drawio-desktop docker deepl \
#         adobe-creative-cloud)

echo "${LIST[@]}"