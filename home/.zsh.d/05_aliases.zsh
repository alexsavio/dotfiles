# Aliases

# eza (successor to exa)
if (( $+commands[eza] )); then
  alias ls='eza'
  alias l='eza -l --all --group-directories-first --git'
  alias ll='eza -l --all --all --group-directories-first --git'
  alias lt='eza -T --git-ignore --level=2 --group-directories-first'
  alias llt='eza -lT --git-ignore --level=2 --group-directories-first'
  alias lT='eza -T --git-ignore --level=4 --group-directories-first'
elif (( $+commands[exa] )); then
  alias ls='exa'
  alias l='exa -l --all --group-directories-first --git'
  alias ll='exa -l --all --all --group-directories-first --git'
  alias lt='exa -T --git-ignore --level=2 --group-directories-first'
  alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
  alias lT='exa -T --git-ignore --level=4 --group-directories-first'
else
  alias l='ls -lah'
  alias ll='ls -alF'
  alias la='ls -A'
fi

# bat
(( $+commands[bat] )) && alias cat='bat --style=plain'

# xcp
(( $+commands[xcp] )) && alias cp='xcp'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias path='echo -e ${PATH//:/\\n}'

# Grep & disk
alias -g grp='| grep -i'
alias du='du -kch'

# Git
alias lg='lazygit'
alias gst='git status'
alias ggpull='git pull origin "$(git rev-parse --abbrev-ref HEAD)"'
alias ggpush='git push origin "$(git rev-parse --abbrev-ref HEAD)"'
alias gf='git fetch'
alias gco='git checkout'
alias gcp='git cherry-pick'

# Folder shortcuts
alias myprojs='cd ~/projects'
alias mydocs='cd ~/Documents'
alias mydowns='cd ~/Downloads'
alias mydesk='cd ~/Desktop'
alias mydbox='cd ~/Dropbox'

hash -d dbox=~/Dropbox
hash -d prjs=~/projects

# Misc
alias please='sudo'
alias oc='opencode'
alias jupy='jupyter console'
alias jupynb='jupyter notebook'

# Docker
if (( $+commands[docker] )); then
  alias de="env | grep DOCKER_"
  alias dl="docker ps -l -q"
  alias dps="docker ps"
  alias dpa="docker ps -a"
  alias di="docker images"
  alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
  alias dkd="docker run -d -P"
  alias dki="docker run -i -t -P"
  alias dex="docker exec -i -t"
fi
