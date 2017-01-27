#!/bin/zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README; do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
