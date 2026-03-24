# Completions — single compinit, cached daily

# Docker CLI completions
[[ -d "$HOME/.docker/completions" ]] && fpath=($HOME/.docker/completions $fpath)

# Bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"

# Carapace (handles just, mise, and many more)
if (( $+commands[carapace] )); then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
  zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
  source <(carapace _carapace)
fi

# fzf-tab (must load before compinit)
[[ -d ~/.zsh/plugins/fzf-tab ]] && source ~/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# Cached compinit — only regenerate once per day
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Compile zcompdump in background for faster loading
{
  [[ -s ~/.zcompdump ]] && [[ ! -s ~/.zcompdump.zwc || ~/.zcompdump -nt ~/.zcompdump.zwc ]] && \
    zcompile ~/.zcompdump
} &!

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
