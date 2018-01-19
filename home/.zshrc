
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone --branch 2.4.2 https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

zplug "zplug/zplug", hook-build: "zplug --self-manage"

zplug "zsh-users/zsh-history-substring-search", from:github
zplug "zsh-users/zsh-autosuggestions", from:github

zplug "popstas/zsh-command-time", from:github
zplug "gko/ssh-connect", from:github

zplug "felixr/docker-zsh-completion", from:github
zplug "GuilleDF/zsh-ubuntualiases", from:github
zplug "peterhurford/git-aliases.zsh", from:github

zplug "wbingli/zsh-wakatime", from:github

zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source packages and add commands to $PATH
zplug load

# Customize to your needs...
if [[ -s "${ZDOTDIR:-$HOME}/.zsh.d" ]]; then
  for i in `ls ~/.zsh.d/*sh`; do source $i; done
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

USERNAME='Alexandre M. S.'
TODAY=`date +%d/%m/%Y`
