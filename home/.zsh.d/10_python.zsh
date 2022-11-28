#!/usr/bin/env zsh

# pyenv (asdf still uses pyenv under the hood)
export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M" # Use aria2c when downloading
asdf global python 3.11.0

export PYENV_ROOT="$HOME/.pyenv"
# addapath "$PYENV_ROOT/bin"
eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'

export PIPX_DEFAULT_PYTHON=python