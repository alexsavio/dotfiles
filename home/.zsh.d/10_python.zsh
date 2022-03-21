#!/usr/bin/env zsh

export PYENV_ROOT="$HOME/.pyenv"
addapath "$PYENV_ROOT/bin"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
export PIPENV_PYTHON=$(pyenv root)/shims/python
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

export PIPX_DEFAULT_PYTHON=$(pyenv root)/shims/python
