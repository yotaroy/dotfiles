#!/bin/sh

if command -v brew > /dev/null 2>&1; then
  brew bundle --file=./Brewfile
fi

./zsh/install.sh

./tmux/install.sh

./deploy.sh

