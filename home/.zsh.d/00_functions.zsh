#!/usr/bin/env zsh

addpathsuffix() {
  if [ -e $1 ]; then
    export PATH=$PATH:$1
  fi
}

addpathprefix() {
  if [ -e $1 ]; then
      export PATH=$1:$PATH
  fi
}

addlibpath() {
    [ -e $1 ] && export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
}

isinpath() {
    (( $+commands[$1] ))
}
