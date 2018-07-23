#!/usr/bin/env zsh

isinpath() {
    (( $+commands[$1] ))
}

if ( isinpath pyenv ); then
  eval "$(pyenv init -)"
fi
