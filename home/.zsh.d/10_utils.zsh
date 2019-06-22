#!/usr/bin/env zsh

addapath ./node_modules/.bin
addapath ${HOME}/.local/bin

if ( isinpath direnv ); then
  eval "$(direnv hook zsh)"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

alias grun='$HOME/.nvm/versions/node/v11.3.0/bin/gr'
. <(grun completion)
