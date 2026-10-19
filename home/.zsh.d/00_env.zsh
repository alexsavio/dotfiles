# Environment variables, PATH, and homeshick (zero subprocesses)

# Homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

# Core paths
typeset -U path  # deduplicate
path=(
  $HOME/bin
  $HOME/.local/bin
  $HOME/.cargo/bin
  $HOME/.avm/bin
  $HOME/.local/share/solana/install/active_release/bin
  $HOME/.codeium/windsurf/bin
  $HOME/.lmstudio/bin
  $HOME/.antigravity/antigravity/bin
  $HOME/.opencode/bin
  /usr/local/bin
  /usr/local/sbin
  $path
)

# Cargo env (sets CARGO_HOME etc. without duplicating PATH)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Editors
if (( $+commands[nvim] )); then export EDITOR=nvim; else export EDITOR=vim; fi
export GIT_EDITOR=$EDITOR

# Software
export SOFT_PATH="$HOME/software"

# Obsidian vault (read by Claude Code skills)
export OBSIDIAN_VAULT_ROOT="$HOME/Library/CloudStorage/Dropbox/Apps/obsidian-claude/claude"