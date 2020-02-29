#!/usr/bin/env zsh

if ( isinpath direnv ); then
  eval "$(direnv hook zsh)"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

addapath $HOME/.pulumi/bin
addapath $HOME/.tfenv/bin
