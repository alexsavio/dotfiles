# vim:ft=zplug

zplug "zplug/zplug", hook-build: "zplug --self-manage"

zplug "~/.zsh.d", from:local, use:"<->_*.zsh"

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
zplug 'Valodim/zsh-curl-completion'

zplug 'b4b4r07/fzf-powertools', \
    as:command, \
    use:'re'

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug 'b4b4r07/zplug-doctor', lazy:yes
zplug 'b4b4r07/zplug-cd', lazy:yes
zplug 'b4b4r07/zplug-rm', lazy:yes

zplug 'b4b4r07/git-fzf', hook-build:'make'
zplug 'b4b4r07/git-fzf', \
    as:command, \
    use:'bin/(git-*).zsh', \
    rename-to:'$1'

# zplug "knu/zsh-manydots-magic", use:manydots-magic, defer:2

zplug "popstas/zsh-command-time", from:github
zplug "gko/ssh-connect", from:github

zplug "felixr/docker-zsh-completion", from:github
zplug "peterhurford/git-aliases.zsh", from:github
zplug "plugins/git", from:oh-my-zsh

zplug "wbingli/zsh-wakatime", from:github

zplug "mafredri/zsh-async", from:github, defer:0
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
