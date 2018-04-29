# vim:ft=zplug

zplug "zplug/zplug", hook-build: "zplug --self-manage"

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
# zplug "plugins/fossil", from:oh-my-zsh

zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh

zplug "plugins/python", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh

zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/gpg-agent", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh

zplug "plugins/aws", from:oh-my-zsh
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/battery", from:oh-my-zsh


# zplug "b4b4r07/enhancd", use:init.sh
# if zplug check "b4b4r07/enhancd"; then
#     #export ENHANCD_FILTER="fzf --height 50% --reverse --ansi --preview 'ls -l {}' --preview-window down"
#     export ENHANCD_FILTER="fzf --height 50% --reverse --ansi"
#     export ENHANCD_DOT_SHOW_FULLPATH=1
# fi

zplug "zsh-users/zsh-completions", defer:0
zplug "zsh-users/zsh-autosuggestions", defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

zplug "glidenote/hub-zsh-completion"

zplug "b4b4r07/enhancd", use:enhancd.sh
zplug 'b4b4r07/fzf-powertools', \
    as:command, \
    use:'re'

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug 'b4b4r07/git-fzf', hook-build:'make'
zplug 'b4b4r07/git-fzf', \
    as:command, \
    use:'bin/(git-*).zsh', \
    rename-to:'$1'

zplug "popstas/zsh-command-time", from:github
zplug "gko/ssh-connect", from:github
zplug "gangleri/pipenv", from:github

zplug "felixr/docker-zsh-completion", from:github
zplug "peterhurford/git-aliases.zsh", from:github

zplug "wbingli/zsh-wakatime", from:github

zplug "~/.zsh.d", from:local, use:"<->_*.zsh"

zplug "mafredri/zsh-async", from:github, defer:0
zplug 'knu/zsh-manydots-magic', use:manydots-magic, defer:3

zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
