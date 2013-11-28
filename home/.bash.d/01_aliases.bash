if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias df='df -H'
alias du='du -ch'
 
# top is atop, just like vi is vim
alias top='atop'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
    alias agu='sudo apt-get upgrade'
    alias agi='sudo apt-get install'
    alias agr='sudo apt-get remove'
    alias agr='sudo apt-get purge'
fi

#folders gotos
alias mydocs='cd ~/Documents'
alias mydowns='cd ~/Downloads'
alias mydesk='cd ~/Desktop'
alias mymusic='cd ~/Music'
alias myvideos='cd ~/Videos'
alias mydbox='cd ~/Dropbox'

alias lock='gnome-screensaver-command --lock'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
function ipyqt(){
    python -c 'import IPython; IPython.start_ipython(['"'"'qtconsole'"'"']);'
}



