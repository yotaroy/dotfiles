#!/bin/sh

# If the definition of git completion is old, run this script to update the definition.
if [ ! -d ${HOME}/.zsh/completion ]
then
  echo "============ Create ~/.zsh/completion directory ============ "
  mkdir ${HOME}/.zsh/completion
fi

cd ${HOME}/.zsh/completion
# curl -O https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
# curl -O https://raw.github.com/git/git/master/contrib/completion/git-completion.zsh
curl -O https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
mv git-completion.zsh _git

