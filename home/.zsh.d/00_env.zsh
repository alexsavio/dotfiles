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
  $HOME/.bun/global/node_modules/.bin
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

# Bun
export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && path=($BUN_INSTALL/bin $path)

# Editors
export EDITOR=vim
export GIT_EDITOR=vim

# Software
export SOFT_PATH="$HOME/software"
