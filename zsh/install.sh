#!/bin/sh

echo "============ Create ~/.zsh directory ============ "
mkdir ${HOME}/.zsh

# zsh-completions
# https://github.com/zsh-users/zsh-completions
echo "============ Install zsh-completions ============ "
git clone https://github.com/zsh-users/zsh-completions.git ${HOME}/.zsh/zsh-completions
FPATH=${HOME}/.zsh/zsh-completions/src
rm -f ~/.zcompdump

echo "============ Setting for git completions ============ "
./git-completion.sh

# zinit
# https://github.com/zdharma-continuum/zinit
echo "============ Install zinit ============ "
mkdir ${HOME}/.zinit
git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit/bin

