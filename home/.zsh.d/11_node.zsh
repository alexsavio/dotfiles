#!/usr/bin/env zsh

export NODENV_DIR="$HOME/.nodenv"
export NODE_VERSIONS="$NODENV_DIR/versions"
export NODE_VERSION_PREFIX=""

eval "$(nodenv init -)"

# bun
export BUN_INSTALL="$HOME/.bun"
addapath "$BUN_INSTALL/bin"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
