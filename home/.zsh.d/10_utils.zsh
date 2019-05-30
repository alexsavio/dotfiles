#!/usr/bin/env zsh

# add local node_module bin to path
addapath ./node_modules/.bin

addapath ${HOME}/.local/bin

if ( isinpath direnv ); then
  eval "$(direnv hook zsh)"
fi

if [ -d ${SOFT_PATH}/flutter/ ]; then 
    export FLUTTER_DIR=${SOFT_PATH}/flutter/
    addapath ${FLUTTER_DIR}/bin
fi

