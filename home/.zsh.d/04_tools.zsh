# Tool initializations — cached where possible

# _cached_eval: cache tool init output, invalidate when binary changes
_cached_eval() {
  local name=$1; shift
  local cache_dir="$HOME/.zsh/cache"
  local cache_file="$cache_dir/$name.zsh"
  local bin_path="${commands[$name]:-$(whence -p $name 2>/dev/null)}"

  if [[ -n "$bin_path" && -s "$cache_file" && "$cache_file" -nt "$bin_path" ]]; then
    source "$cache_file"
  else
    local output
    output="$("$@")" && {
      print -r -- "$output" >| "$cache_file"
      source "$cache_file"
    }
  fi
}

# Starship prompt
(( $+commands[starship] )) && _cached_eval starship starship init zsh

# Zoxide (smart cd)
(( $+commands[zoxide] )) && _cached_eval zoxide zoxide init zsh

# Mise (replaces nodenv, nvm, asdf)
(( $+commands[mise] )) && _cached_eval mise mise activate zsh

# Direnv
(( $+commands[direnv] )) && _cached_eval direnv direnv hook zsh

# fzf keybindings and completion
if (( $+commands[fzf] )); then
  _cached_eval fzf fzf --zsh
fi

# Broot
[[ -f ~/.config/broot/launcher/bash/br ]] && source ~/.config/broot/launcher/bash/br

# Worktrunk
if (( $+commands[wt] )); then
  _cached_eval wt wt config shell init zsh
fi
