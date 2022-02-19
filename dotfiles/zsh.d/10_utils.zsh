#!/usr/bin/env zsh

( isinpath direnv ) &&  eval "$(direnv hook zsh)"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

addpathsuffix $HOME/.pulumi/bin
addpathsuffix $HOME/.tfenv/bin
addpathsuffix $HOME/software/balena-cli
