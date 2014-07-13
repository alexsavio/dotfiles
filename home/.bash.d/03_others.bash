
#export SSH_AUTH_SOCK=0
#source ~/bin/ssh-find-agent.sh
#set_ssh_agent_socket

### START-Keychain ###
# Let  re-use ssh-agent and/or gpg-agent between logins
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'
alias git='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && git'

#eval $(keychain --clear --eval id_rsa)
#source $HOME/.keychain/$HOSTNAME-sh
### End-Keychain ###

export CUDA_VISIBLE_DEVICES="1"

export GIT_PYTHON_TRACE=full
