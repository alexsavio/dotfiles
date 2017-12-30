#!/usr/bin/env zsh

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

alias lock='gnome-screensaver-command --lock'
alias skn='sudo killall -9 NetworkManager'
