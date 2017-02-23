#!/usr/bin/env zsh

addapath() {
  if [ -e $1 ]; then
    export PATH=$PATH:$1
  fi
}

addlibpath() {
    if [ -e $1 ]; then
        if [[ "$(uname -s)" == 'Darwin' ]]
        then
            export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:$1
        else
            export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
        fi
    fi
}

isinpath() {
    (( $+commands[$1] ))
}
