#!/usr/bin/env zsh

( isinpath direnv ) &&  eval "$(direnv hook zsh)"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

addapath $HOME/.pulumi/bin
addapath $HOME/.tfenv/bin

