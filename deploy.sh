#!/bin/sh

set -eu

for f in .??*
do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".config" ] && continue
  [ "$f" = ".DS_Store" ] && continue

  ln -snfv ${PWD}/"$f" ${HOME}/"$f"
done

mkdir -p ${HOME}/.config

for f in .config/*
do
  ln -snfv ${PWD}/"$f" ${HOME}/"$f"
done
