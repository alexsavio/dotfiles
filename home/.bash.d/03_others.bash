
#export SSH_AUTH_SOCK=0
#source ~/bin/ssh-find-agent.sh
#set_ssh_agent_socket
eval `keychain --eval id_rsa`

export CUDA_VISIBLE_DEVICES="1"

export GIT_PYTHON_TRACE=full
