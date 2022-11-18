#!/usr/bin/env zsh

export NODENV_DIR="$HOME/.nodenv"
export NODE_VERSIONS="$NODENV_DIR/versions/"
export NODE_VERSION_PREFIX=""

eval "$(nodenv init -)"
