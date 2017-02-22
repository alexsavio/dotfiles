#!/usr/bin/env zsh

addapath() {
  if [ -e $1 ]; then
    export PATH=$PATH:$1
  fi
}

addlibpath() {
    if [ -e $1 ]; then
        if [[ "$(uname -s)" == 'Darwin' ]]
        then
            export DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:$1
        else
            export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
        fi
    fi
}

isinpath() {
    (( $+commands[$1] ))
}

# enable color support of ls and also add handy aliases
if ( isinpath dircolors ); then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --group-directories-first --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='nocorrect grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alhF'
alias la='ll -A'
alias l='ll -CF'

alias ..='cd ..'
alias ...='cd ...'

alias -g grp='| grep -i'
alias du='du -kch'

# top is atop, just like vi is vim
alias top='atop'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get update'
    alias agu='sudo apt-get upgrade'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias agr='sudo apt-get purge'
    alias as='apt-cache search'
    alias aw='apt-cache show'
fi

#vagrant aliases
if ( isinpath vagrant ); then
	alias vagrup="FORWARD_DOCKER_PORTS='true' vagrant up"
	alias vagrhalt='vagrant halt'
	alias vup="vagrant up"
	alias vh="vagrant halt"
	alias vs="vagrant suspend"
	alias vr="vagrant resume"
	alias vrld="vagrant reload"
	alias vssh="vagrant ssh"
	alias vstat="vagrant status"
fi

# git aliases
if ( isinpath git ); then
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.ci commit
    git config --global alias.st status
    git config --global alias.unstage 'reset HEAD --'
    git config --global alias.last 'log -1 HEAD'
fi

#folders gotos
alias mydocs='cd ~/Documents'
alias mydowns='cd ~/Downloads'
alias mydesk='cd ~/Desktop'
alias mymusic='cd ~/Music'
alias mydbox='cd ~/Dropbox'
alias myprojs='cd ~/Projects'

#folders hashes
hash -d dbox='~/Dropbox'
hash -d prjs='~/Projects'

alias lock='gnome-screensaver-command --lock'
alias skn='sudo killall -9 NetworkManager'
alias please='sudo'

alias annex='git annex'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias jupy="jupyter console"
alias jupynb="jupyter notebook"

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

#function ipyqt(){
    #python3 -c 'import IPython; IPython.start_ipython(['"'"'qtconsole'"'"']);'
#}

#function ipynote(){
#    python3 -c 'import IPython; IPython.start_ipython(['"'"'notebook'"'"']);'
#}

#alias pip_Uall="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"

#docker aliases
if ( isinpath docker ); then
    # check that the Docker environment is setup
    alias de="env | grep DOCKER_"
    # Get latest container ID
    alias dl="docker ps -l -q"
    # Get container process
    alias dps="docker ps"
    # Get process included stop container
    alias dpa="docker ps -a"
    # Get images
    alias di="docker images"
    # Get container IP
    alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
    # Run deamonized container, e.g., $dkd base /bin/echo hello
    alias dkd="docker run -d -P"
    # Run interactive container, e.g., $dki base /bin/bash
    alias dki="docker run -i -t -P"
    # Execute interactive container, e.g., $dex base /bin/bash
    alias dex="docker exec -i -t"
    # Stop all containers
    dstop() { docker stop $(docker ps -a -q); }
    # Remove all containers
    drm() { docker rm $(docker ps -a -q); }
    # Stop and Remove all containers
    alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
    # Remove all images
    dri() { docker rmi $(docker images -q); }
    # Dockerfile build, e.g., $dbu tcnksm/test
    dbu() { docker build -t=$1 .; }
    # Show all alias related docker
    dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
    # Bash into running container
    dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
    # clean up all dangling images:
    docker-clean() { docker rmi -f $(docker images -q -a -f dangling=true) }
    # remove all docker images
    alias dimgrm='docker images | awk "{print $3}" | xargs docker rmi'
    # clean up ALL
    docker-cleanall() { docker rm -v $(docker ps -a -q -f status=exited);
                        docker-clean;
                        docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes;
                    }
fi
