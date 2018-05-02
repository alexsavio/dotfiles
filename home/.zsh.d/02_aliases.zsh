#!/usr/bin/env zsh

alias grep='nocorrect grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -alhFG'
alias ls='ls -G'
alias la='ll -A'
alias l='ll -CF'

alias ..='cd ..'
alias ...='cd ...'

alias -g grp='| grep -i'
alias du='du -kch'

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
	alias vburn="vagrant destroy -f"
fi

#vagrant aliases
if ( isinpath fasd ); then
    eval "$(fasd --init auto)"

    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd cd -d -i' # cd with interactive selection
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

# 例: ls | grep word -> ls G word
alias -g L='| less'
alias -g M='| more'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g C='| pbcopy'

alias diff='colordiff -u'

#folders gotos
alias mydocs='cd ~/Documents'
alias mydowns='cd ~/Downloads'
alias mydesk='cd ~/Desktop'
alias mymusic='cd ~/Music'
alias mydbox='cd ~/Dropbox'
alias myprojs='cd ~/projects'

#folders hashes
hash -d dbox='~/Dropbox'
hash -d prjs='~/projects'

alias please='sudo'

alias annex='git annex'

alias jupy="jupyter console"
alias junb="jupyter notebook"
alias julab="jupyter lab"

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
    # Execute /bin/bash in interactive container
    dssh() { docker exec -i -t $1 /bin/bash; }
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
