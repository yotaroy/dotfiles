#!/bin/sh

echo "============ Create ~/.zsh directory ============ "
mkdir ${HOME}/.zsh

# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
echo "============ Install zsh-autosuggestions ============ "
git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.zsh/zsh-autosuggestions

# zsh-completions
# https://github.com/zsh-users/zsh-completions
echo "============ Install zsh-completions ============ "
git clone https://github.com/zsh-users/zsh-completions.git ${HOME}/.zsh/zsh-completions
FPATH=${HOME}/.zsh/zsh-completions/src
rm -f ~/.zcompdump

echo "============ Setting for git completions ============ "
./git-completion.sh
