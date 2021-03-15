#!/usr/bin/env zsh

addapath() {
  [ -e $1 ] && export PATH=$PATH:$1
}

addlibpath() {
    [ -e $1 ] && export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
}

isinpath() {
    (( $+commands[$1] ))
}
