
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
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
if [ -e ~/vagrant ]; then
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

#docker aliases
#http://kartar.net/2014/03/some-useful-docker-bash-functions-and-aliases/
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
drm() { docker rm $(docker ps -q -a); }
dri() { docker rmi $(docker images -q); }
alias dkd="docker run -d -P"
alias dki="docker run -t -i -P"
db() { docker build -t="$1" .; }


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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias ipy="python3 -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
function ipyqt(){
    python3 -c 'import IPython; IPython.start_ipython(['"'"'qtconsole'"'"']);'
}

function ipynote(){
    python3 -c 'import IPython; IPython.start_ipython(['"'"'notebook'"'"']);'
}

#alias pip_Uall="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs pip install -U"
