#!/usr/bin/env zsh

# Cargo environment
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

addapath "${HOME}/.cargo/bin"
addapath "${HOME}/.avm/bin"
addapath "${HOME}/.local/share/solana/install/active_release/bin"