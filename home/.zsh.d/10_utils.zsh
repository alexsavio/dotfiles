#!/usr/bin/env zsh

#export SSH_AUTH_SOCK=0
#source ~/bin/ssh-find-agent.sh
#set_ssh_agent_socket

# add local node_module bin to path
export PATH="./node_modules/.bin:$PATH"

addapath ${HOME}/.local/bin

# Let  re-use ssh-agent and/or gpg-agent between logins
if ( isinpath keychain ); then
  alias ssh='eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'
  alias git='eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && git'
fi

#eval $(keychain --clear --eval id_rsa)
#source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###s

# zsh-functional
if [ -d ${SOFT_PATH}/zsh-functional ];
then
    . ${SOFT_PATH}/zsh-functional/functional.plugin.zsh
fi

# github.com/rupa/z
if [ -d ${SOFT_PATH}/z ];
then
    . ${SOFT_PATH}/z/z.sh
fi

# github.com/clvv/fasd
if ( isinpath fasd ); then
    eval "$(fasd --init auto)"
fi
