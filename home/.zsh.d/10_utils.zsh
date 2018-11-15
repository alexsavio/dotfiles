#!/usr/bin/env zsh

# add local node_module bin to path
export PATH="./node_modules/.bin:$PATH"

addapath ${HOME}/.local/bin

if ( isinpath direnv ); then
  eval "$(direnv hook zsh)"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
