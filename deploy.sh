#!/bin/sh

set -eu

for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -snfv ${PWD}/"$f" ${HOME}/"$f"
done

ln -snfv ${PWD}/config/nvim ${HOME}/.config
