# Prerequisites

These dotfiles are created for Macos on Intel. After reinstalling OS or getting a new Mac, do this first:

1. Manually install Xcode from the App Store.
2. Install command line tools: `xcode-select --install`.
3. Accept Xcode license agreement: `sudo xcodebuild -license`.

# Installation

1. Run `install.sh` for basic setup.

Install script also takes the following optional arguments:

- `-f script`: continue running from the next script after _script_. This will skip all scripts up to, and including _script_.
- `-o script`: disregard the runlist and only run a single _script_.
- `-r`: reinstall mode: uninstall each tool before installing. Can be used alone (in which case reinstall mode is applied to entire runlist), or combined with either of the above options.

# Install manually

- Microsoft One Note

# Postrequisites

- System Preferences - Security and Privacy: Require password _immediately_ after sleep or screen saver begins.
- System Preferences - Desktop and screen saver: Show screen saver after 5 minutes.
- Switch default shell to zsh.
- Switch iTerm2 font to `Hack Nerd Font`.
- iTerm2 - Preferences - General - Selection - Applications in terminal may access clipboard.
- Run `tmux`, do a `prefix + I` (capital i, as in Install) to fetch the plugins.
- Run `:checkhealth` in vim. Confirm neovim runs.
- Run `:COQdeps` in nvim. Confirm operation with `:COQnow`.
- Configure SSH keys.
- Configure macos keyboard shortcuts.
- Check postrequisites in personal notes.

# Keyboard shortcuts

- Switch `Caps Lock` with `Control`
- `Cmd + Option + RightArrow` - select next tab
- `Cmd + Option + LeftArrow` - select previous tab

