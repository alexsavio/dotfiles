
#export SSH_AUTH_SOCK=0
#source ~/bin/ssh-find-agent.sh
#set_ssh_agent_socket

### START-Keychain ###
# Let  re-use ssh-agent and/or gpg-agent between logins
if [ -f /usr/bin/keychain ]; then
  alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'
  alias git='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && git'
fi

#eval $(keychain --clear --eval id_rsa)
#source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###

# zsh-functional
if [ -d ${SOFT_PATH}/zsh-functional ];
then
    . ${SOFT_PATH}/zsh-functional/functional.plugin.zsh
fi


# CUDA
export CUDA_VISIBLE_DEVICES="1"

export GIT_PYTHON_TRACE=full

#if [ -f /usr/bin/byobu ]; then
#    _byobu_sourced=1 
#    . /usr/bin/byobu-launch
#fi
