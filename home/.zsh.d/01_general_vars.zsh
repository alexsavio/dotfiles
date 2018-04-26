#!/usr/bin/env zsh


#HOMESCHICK
#git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# important paths
export SOFT_PATH=${HOME}/software

addapath ~/bin
addapath ${SOFT_PATH}/myrepos
addapath ${HOME}/.local/bin

# Your place for hosting Git repos.
export GIT_HOSTING='git@github.alexsavio.com'

# Set my editor and git editor
export EDITOR=/usr/bin/vim
export GIT_EDITOR=/usr/bin/vim
export MP_EDITOR=/usr/bin/edit
#
# # why would you type 'cd dir' if you could just type 'dir'?
# setopt AUTO_CD
#
# # Now we can pipe to multiple outputs!
# setopt MULTIOS
#
# # This makes cd=pushd
# setopt AUTO_PUSHD
#
# # This will use named dirs when possible
# setopt AUTO_NAME_DIRS
#
# # If we have a glob this will expand it
# setopt GLOB_COMPLETE
# setopt PUSHD_MINUS
#
# # No more annoying pushd messages...
# # setopt PUSHD_SILENT
#
# # blank pushd goes to home
# setopt PUSHD_TO_HOME
#
# # this will ignore multiple directories for the stack. Useful? I dunno.
# setopt PUSHD_IGNORE_DUPS
#
# # 10 second wait if you do something that will delete everything. I wish I'd had this before...
# setopt RM_STAR_WAIT
#
# # use magic (this is default, but it can't hurt!)
# # setopt ZLE
#
# setopt NO_HUP
#
# setopt IGNORE_EOF
#
# # If I could disable Ctrl-s completely I would!
# setopt NO_FLOW_CONTROL
#
# # Keep echo "station" > station from clobbering station
# setopt NO_CLOBBER
#
# # Case insensitive globbing
# setopt NO_CASE_GLOB
#
# # Be Reasonable!
# setopt NUMERIC_GLOB_SORT
#
# # I don't know why I never set this before.
# setopt EXTENDED_GLOB
#
# # hows about arrays be awesome? (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
# setopt RC_EXPAND_PARAM
#
# # Who doesn't want home and end to work?
# bindkey '\e[1~' beginning-of-line
# bindkey '\e[4~' end-of-line
#
# # Incremental search is elite!
# bindkey -M vicmd "/" history-incremental-search-backward
# bindkey -M vicmd "?" history-incremental-search-forward
#
# # Search based on what you typed in already
# bindkey -M vicmd "//" history-beginning-search-backward
# bindkey -M vicmd "??" history-beginning-search-forward
#
# bindkey "\eOP" run-help
#
# # oh wow! This is killer... try it!
# bindkey -M vicmd "q" push-line
#
# # it's like, space AND completion. Gnarlbot.
# bindkey -M viins ' ' magic-space
